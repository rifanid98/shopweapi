/**
 * Model
 * .
 * Load Model
 */
const usersModel = require("../models/m_users");

// custom response
const myResponse = require("../helpers/myResponse");

// import joi
const validate = require('../helpers/joiSchema');

// import bcrypt
const bcrypt = require("bcrypt");

// helpers
const myHelpers = require('../helpers/myHelpers');

// import config
const config = require('../configs/global');

// import custom error message
const errorMessage = require("../helpers/myErrorMessage");

// import delete
const deleteImage = require("../helpers/deleteImage");


/**
 * CRUD
 */
async function getUsers(req, res) {
	try {
		const filters = req.query;
		const fields = await usersModel.getFieldsName();
		const totalData = await usersModel.getTotalData();
		const generatedFilters = myHelpers.generateFilters(filters, fields);
		const result = await usersModel.getData(generatedFilters, totalData, fields);
		if (result.result > 0) {
			result.previousPage = req.protocol + '://' + req.get('host') + req.originalUrl;
			if (req.query.page > 1) result.previousPage = result.previousPage.replace(`page=${req.query.page}`, `page=${parseInt(req.query.page) - 1}`)
			result.nextPage = req.protocol + '://' + req.get('host') + req.originalUrl;
			result.nextPage = result.nextPage.replace(`page=${req.query.page}`, `page=${parseInt(req.query.page) + 1}`)
		}
		return myResponse.response(res, "success", result, 200, "Ok!");
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function postUser(req, res) {
	try {
		// Joi validation
		const fieldToPatch = Object.keys(req.body);
		await validate.validateUsers(req.body, fieldToPatch);

		const body = req.body;
		const checkUser = await usersModel.getDataByName(body.username);

		if (checkUser.length > 0) {
			if (req.file) {
				// delete new image when duplicated data
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);
			}

			const message = `Duplicate data ${body.username}`;
			return myResponse.response(res, "failed", "", 409, message);
		}

		if (req.file === undefined) {
			// set default file when no image to upload
			body.image = `avatar.png`;
			// body.image = `${config.imageUrlPath(req)}avatar.png`;
		} else {
			if (req.file.mimetype === 'image/jpeg' || req.file.mimetype === 'image/png') {
				// get the image name and set into data
				body.image = `${req.file.filename}`;
				// body.image = `${config.imageUrlPath(req)}${req.file.filename}`;
			} else {
				// delete new file when not an image
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);

				const message = `There is no image to upload`;
				return myResponse.response(res, "failed", "", 500, message);
			}
		}

		// generate access_key
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

		const result = await usersModel.addData(body);
		if (result.affectedRows > 0) {
			body.id = result.insertId;
			delete body.password
			return myResponse.response(res, "success", body, 201, "Created!");
		} else {
			if (req.file) {
				// delete new image when insert data is failed
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);
			}

			const message = `Add data failed`;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);

		// delete image when error
		if (req.file) {
			const myRequest = { protocol: req.protocol, host: req.get('host') }
			deleteImage.delete(myRequest, req.file.filename);
		}

		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function patchUser(req, res) {
	try {
		// get data to validate
		const fieldToPatch = Object.keys(req.body);
		await validate.validateUsers(req.body, fieldToPatch);

		// checking if data is exists or not
		const id = req.params.id;
		const oldData = await usersModel.getDataById(id);
		if (oldData.length < 1) {
			// delete new image when duplicated data
			const myRequest = { protocol: req.protocol, host: req.get('host') }
			deleteImage.delete(myRequest, req.file.filename);

			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}

		// checking if user want to change the username of user
		const body = req.body;
		if (body.username !== undefined) {
			const checkUser = await usersModel.getDataByName(body.username);
			if (checkUser.length > 0) {
				if (req.file) {
					// delete new image when duplicated data
					const myRequest = { protocol: req.protocol, host: req.get('host') }
					deleteImage.delete(myRequest, req.file.filename);
				}

				const message = `Duplicate data ${body.username}`;
				return myResponse.response(res, "failed", "", 409, message);
			}
		}

		// checking is there a file or not
		let data = {};
		if (req.file === undefined) {
			// if there is no file to upload
			data = {
				...body
			};
		} else {
			// checking type of file
			if (req.file.mimetype === 'image/jpeg' || req.file.mimetype === 'image/png') {
				data = {
					...body,
					// image: `${config.imageUrlPath(req)}${req.file.filename}`,
					image: `${req.file.filename}`,
				};
			} else {
				// delete new file when not an image
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);

				const message = `There is no image to upload`;
				return myResponse.response(res, "failed", "", 500, message);
			}
		}

		if (data.password) {
			const salt = bcrypt.genSaltSync(10);
			const hash = bcrypt.hashSync(data.password, salt);
			data.password = hash;
		}

		// update the user data
		const result = await usersModel.updateData(data, id);

		// prepare the respond data
		const newData = {
			user_id: id,
			...data,
		};

		// if update is success
		if (result.affectedRows > 0) {
			const imageName = oldData[0].image;
			// const imageName = oldData[0].image.split('/').pop();
			if (imageName != 'avatar.png' && req.file !== undefined) {
				// delete old image when not default image
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, oldData[0].image);
			}
			delete newData.password
			return myResponse.response(res, "success", newData, 200, "Updated!");
		}
		// if update is failed
		else {
			// delete new image when update data is failed
			const myRequest = { protocol: req.protocol, host: req.get('host') }
			deleteImage.delete(myRequest, req.file.filename);

			const message = `Update data ${data.username} failed `;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);

		// delete image when error
		if (req.file) {
			const myRequest = { protocol: req.protocol, host: req.get('host') }
			deleteImage.delete(myRequest, req.file.filename);
		}

		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function deleteUser(req, res) {
	try {
		const id = req.params.id;
		const oldData = await usersModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}
		const result = await usersModel.deleteData(id);
		if (result.affectedRows > 0) {
			const imageName = oldData[0].image.split('/').pop();
			if (imageName != 'avatar.png') {
				// delete old image when not default image
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, oldData[0].image);
			}
			return myResponse.response(res, "success", "", 200, 'Deleted');
		} else {
			const message = `Internal Server Error`;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

/**
 * Another CRUD
 */
async function getUserById(req, res) {
	try {
		const id = req.params.id;
		const result = await usersModel.getDataById(id);
		
		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function getUserOrders(req, res) {
	try {
		const id = req.params.id;
		const result = await usersModel.getDataUserOrders(id);

		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function getDetailUserOrders(req, res) {
	try {
		const user_id = req.params.user_id;
		const order_id = req.params.order_id
		const result = await usersModel.getDataDetailUserOrders(user_id, order_id);

		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	postUser,
	patchUser,
	deleteUser,
	getUsers,
	getUserById,
	getUserOrders,
	getDetailUserOrders
}