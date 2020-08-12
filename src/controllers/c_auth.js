/**
 * Model
 * .
 * Load Model
 */
const authModel = require("../models/m_auth");
const usersModel = require("../models/m_users");

/**
 * custom response helper
 * .
 * merapihkan output
 * response: function(res, statusExecution, data, statusCode, message)
 */
const myResponse = require("../helpers/myResponse");

// import joi
const validate = require("../helpers/joiSchema");
// const validate = require("../helpers/joiSchema");

// import bcrypt
const bcrypt = require("bcrypt");

// import jwt
const jwt = require("jsonwebtoken");

// import
const config = require("../configs/global");

// import custom error message
const errorMessage = require("../helpers/myErrorMessage");

// otplib
const { totp } = require('otplib');

"use strict";
const nodemailer = require("nodemailer");

/**
 * CRUD
 */
async function register(req, res) {
	try {
		const body = req.body;

		// validate otp
		const isValid = totp.check(body.otp, process.env.OTP_KEY);
		if (isValid) {
			delete body.otp;
			const fieldToPatch = Object.keys(body);
			await validate.validateRegister(req.body, fieldToPatch);

			const checkData = await authModel.getDataByEmail(body.email);

			if (checkData < 1) {
				if (req.file === undefined) {
					// set default file when no image to upload
					body.image = `${config.imageUrlPath(req)}avatar.png`;
				}

				const username = body.full_name.split(' ')[0];
				body.username = username;

				// generate acces_key
				const name = body.full_name.split(' ');
				let initialName = '';
				if (name.length > 1) {
					initialName += name[0][0];
					initialName += name[1][0];
				} else if (name.length === 1) {
					initialName += name[0][0];
					initialName += name[0][0];
				}
				const randomNumber = Math.floor(Math.random() * 90000) + 10000;
				const acces_key = `${initialName.toUpperCase()}${randomNumber.toString()}`;
				body.access_key = acces_key;

				const salt = bcrypt.genSaltSync(10);
				const hash = bcrypt.hashSync(body.password, salt);
				body.password = hash;
				body.role = 3;

				const result = await authModel.register(body);
				body.insertId = result.insertId;
				delete body.password;
				return myResponse.response(res, "success", body, 201, "Created!");
			} else {
				const message = `duplicate data. ${body.email} is exists`;
				return myResponse.response(res, "failed", "", 409, message);
			}
		} else {
			const message = `otp is not valid.`;
			return myResponse.response(res, "failed", "", 400, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function requestOTP(req, res) {
	try {
		const body = req.body;
		totp.options = {
			digits: 6,
			step: 60 * 5
		};
		const token = totp.generate(process.env.OTP_KEY);
		const transporter = nodemailer.createTransport({
			host: 'smtp.gmail.com',
			port: 465,
			secure: true,
			auth: {
				user: process.env.EMAIL,
				pass: process.env.PASSWORD
			}
		});

		switch (body.requestType) {
			case 'register':
				// send mail with defined transport object
				await transporter.sendMail({
					from: process.env.EMAIL,
					to: body.email,
					subject: 'OTP (One Time Password)',
					text: `This is shown if you request to register your account at ShopWe. OTP : ${token}`,
					// html: "<b>OTP PASSWORD</b>", // html body
				});		
				break;
			
			case 'resetPassword':
				// send mail with defined transport object
				await transporter.sendMail({
					from: process.env.EMAIL,
					to: body.email,
					subject: 'OTP (One Time Password)',
					text: `This is shown if you request to reset your password at ShopWe. OTP : ${token}`,
					// html: "<b>OTP PASSWORD</b>", // html body
				});		
				break;
		
			default:
				break;
		}
		
		const message = {
			otp: token,
			note: 'This is for development only!'
		}
		return myResponse.response(res, "success", message, 201, "Created!");
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function confirmOTP(req, res) {
	try {
		const body = req.body;

		if (body.otp) {
			// validate otp
			const isValid = totp.check(body.otp, process.env.OTP_KEY);
			if (!isValid) {
				const message = `otp is not valid.`;
				return myResponse.response(res, "failed", "", 400, message);
			}
			const message = `otp is valid `;
			return myResponse.response(res, "success", "", 200, message);
		} else {
			const message = `otp doesn't exists! `;
			return myResponse.response(res, "success", "", 404, message);
		}

		
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function resetPassword(req, res) {
	try {
		const body = req.body;
		let id = 0;

		if (body.otp) {
			// validate otp
			const isValid = totp.check(body.otp, process.env.OTP_KEY);
			if (!isValid) {
				const message = `otp is not valid.`;
				return myResponse.response(res, "failed", "", 400, message);
			}

			delete body.otp;
		}

		// data validation
		const fieldToPatch = Object.keys(body);
		await validate.validateResetPassword(body, fieldToPatch);

		if (body.email) {
			// checking if data is exists or not
			const oldData = await usersModel.getDataByEmail(body.email);
			if (oldData.length < 1) {
				const message = `Data with email ${id} not found`;
				return myResponse.response(res, "failed", "", 404, message);
			}
			id = oldData[0].id;
		}

		if (body.id) {
			// checking if data is exists or not
			const oldData = await usersModel.getDataById(body.id);
			if (oldData.length < 1) {
				const message = `Data with id ${body.id} not found`;
				return myResponse.response(res, "failed", "", 404, message);
			}
			id = body.id;
		}

		// password hashing
		const salt = bcrypt.genSaltSync(10);
		const hash = bcrypt.hashSync(body.password, salt);
		body.password = hash;

		// update the user data
		const result = await usersModel.updateData(body, id);

		// if update is success or failed
		if (result.affectedRows > 0) {
			return myResponse.response(res, "success", "", 200, "Updated!");
		} else {
			const message = `Update data ${data.username} failed `;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function login(req, res) {
	try {
		const body = req.body;
		const fieldToPatch = Object.keys(body);
		await validate.validateLogin(body, fieldToPatch);

		// login with username supported
		let result = [];
		if (body.email) result = await authModel.login(body.email);
		if (body.username) result = await authModel.login(body.username);

		if (result.length > 0) {
			if (bcrypt.compareSync(body.password, result[0].password)) {
				delete result[0].password;

				// jsonwebtoken
				const tokenLoginData = {
					user_id: result[0].user_id,
					role: result[0].role,
					name: result[0].username,
					image: result[0].image,
					tokenType: 'login'
				};
				const token = jwt.sign(tokenLoginData, config.jwtSecretKey, { expiresIn: config.jwtTokenLoginLifeTime });
				const tokenRefreshData = {
					user_id: result[0].user_id,
					role: result[0].role,
					name: result[0].username,
					tokenType: 'refresh'
				};
				const tokenRefresh = jwt.sign(tokenRefreshData, config.jwtSecretKey, { expiresIn: config.jwtTokenRefreshLifeTime });
				result[0].tokenLogin = token;
				result[0].tokenRefresh = tokenRefresh;

				return myResponse.response(res, "success", result, 200, "Ok!");
			} else {
				const message = `Email or Password is wrong!`;
				return myResponse.response(res, "failed", "", 400, message);
			}
		} else {
			const message = `Email or Password is wrong!`;
			return myResponse.response(res, "failed", "", 400, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function refresh_token(req, res) {
	try {
		const data = req.body;
		const error = await validate.validateRefreshToken(data);

		const tokenRefresh = data.tokenRefresh;
		const decoded = jwt.verify(tokenRefresh, config.jwtSecretKey);
		console.log(decoded);

		if (decoded.tokenType == 'refresh') {
			delete decoded.iat;
			delete decoded.exp;
			decoded.tokenType = 'login';
			const tokenLogin = jwt.sign(decoded, config.jwtSecretKey, { expiresIn: config.jwtTokenLoginLifeTime });
			decoded.tokenType = 'refresh';
			const tokenRefresh = jwt.sign(decoded, config.jwtSecretKey, { expiresIn: config.jwtTokenRefreshLifeTime });
			return myResponse.response(res, "success", { tokenLogin: tokenLogin, tokenRefresh: tokenRefresh }, 200, "Ok!");
		} else {
			const message = `Wrong token. Please use refresh token`;
			return myResponse.response(res, "failed", error, 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	register,
	resetPassword,
	login,
	refresh_token,
	requestOTP,
	confirmOTP
}