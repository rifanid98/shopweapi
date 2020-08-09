/**
 * Model
 * .
 * Load Model
 */
const productsModel = require("../models/m_products");

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
async function getProducts(req, res) {
	try {
		const filters = req.query;
		const fields = await productsModel.getFieldsName();
		const totalData = await productsModel.getTotalData();
		const generatedFilters = myHelpers.generateFilters(filters, fields);
		const result = await productsModel.getData(generatedFilters, totalData, fields);
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

async function postProduct(req, res) {
	try {
		// Joi validation
		const fieldToPatch = Object.keys(req.body);
		await validate.validateProducts(req.body, fieldToPatch);

		const body = req.body;
		const checkProduct = await productsModel.getDataByName(body.name);

		if (checkProduct.length > 0) {
			if (req.file) {
				// delete new image when duplicated data
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);
			}

			const message = `Duplicate data ${body.name}`;
			return myResponse.response(res, "failed", "", 409, message);
		}

		if (req.file === undefined) {
			// set default file when no image to upload
			body.image = `${config.imageUrlPath(req)}default.png`;
		} else {
			if (req.file.mimetype === 'image/jpeg' || req.file.mimetype === 'image/png') {
				// get the image name and set into data
				body.image = `${config.imageUrlPath(req)}${req.file.filename}`;
			} else {
				// delete new file when not an image
				const myRequest = { protocol: req.protocol, host: req.get('host') }
				deleteImage.delete(myRequest, req.file.filename);

				const message = `There is no image to upload`;
				return myResponse.response(res, "failed", "", 500, message);
			}
		}

		const result = await productsModel.addData(body);
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

async function patchProduct(req, res) {
	try {
		// get data to validate
		const fieldToPatch = Object.keys(req.body);
		await validate.validateProducts(req.body, fieldToPatch);

		// checking if data is exists or not
		const id = req.params.id;
		const oldData = await productsModel.getDataById(id);
		if (oldData.length < 1) {
			// delete new image when duplicated data
			const myRequest = { protocol: req.protocol, host: req.get('host') }
			deleteImage.delete(myRequest, req.file.filename);

			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}

		// checking if product want to change the name of product
		const body = req.body;
		if (body.name !== undefined) {
			const checkProduct = await productsModel.getDataByName(body.name);
			if (checkProduct.length > 0) {
				if (req.file) {
					// delete new image when duplicated data
					const myRequest = { protocol: req.protocol, host: req.get('host') }
					deleteImage.delete(myRequest, req.file.filename);
				}

				const message = `Duplicate data ${body.name}`;
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
					image: `${config.imageUrlPath(req)}${req.file.filename}`,
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

		// update the product data
		const result = await productsModel.updateData(data, id);

		// prepare the respond data
		const newData = {
			product_id: id,
			...data,
		};

		// if update is success
		if (result.affectedRows > 0) {
			const imageName = oldData[0].image.split('/').pop();
			if (imageName != 'default.png' && req.file !== undefined) {
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

			const message = `Update data ${data.name} failed `;
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

async function deleteProduct(req, res) {
	try {
		const id = req.params.id;
		const oldData = await productsModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}
		const result = await productsModel.deleteData(id);
		if (result.affectedRows > 0) {
			const imageName = oldData[0].image.split('/').pop();
			if (imageName != 'default.png') {
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
async function getProductById(req, res) {
	try {
		const id = req.params.id;
		const result = await productsModel.getDataById(id);
		
		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	postProduct,
	patchProduct,
	deleteProduct,
	getProducts,
	getProductById
}