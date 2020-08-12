/**
 * Model
 * .
 * Load Model
 */
const sizesModel = require("../models/m_sizes");

// custom response
const myResponse = require("../helpers/myResponse");

// import joi
const validate = require('../helpers/joiSchema');

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
async function getSizes(req, res) {
	try {
		const filters = req.query;
		const fields = await sizesModel.getFieldsName();
		const totalData = await sizesModel.getTotalData();
		const generatedFilters = myHelpers.generateFilters(filters, fields);
		const result = await sizesModel.getData(generatedFilters, totalData, fields);
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

async function postSize(req, res) {
	try {
		// Joi validation
		const fieldToPatch = Object.keys(req.body);
		await validate.validateSizes(req.body, fieldToPatch);

		const body = req.body;
		const checkSize = await sizesModel.getDataByName(body.name);

		if (checkSize.length > 0) {
			const message = `Duplicate data ${body.name}`;
			return myResponse.response(res, "failed", "", 409, message);
		}

		const result = await sizesModel.addData(body);
		if (result.affectedRows > 0) {
			body.id = result.insertId;
			return myResponse.response(res, "success", body, 201, "Created!");
		} else {
			const message = `Add data failed`;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function patchSize(req, res) {
	try {
		// get data to validate
		const fieldToPatch = Object.keys(req.body);
		await validate.validateSizes(req.body, fieldToPatch);

		// checking if data is exists or not
		const id = req.params.id;
		const oldData = await sizesModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}

		// checking if size want to change the name of size
		const body = req.body;
		if (body.name !== undefined) {
			const checkSize = await sizesModel.getDataByName(body.name);
			if (checkSize.length > 0) {
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
		const data = {
			...body
		};

		// update the size data
		const result = await sizesModel.updateData(data, id);

		// prepare the respond data
		const newData = {
			size_id: id,
			...data,
		};

		// if update is success
		if (result.affectedRows > 0) {
			return myResponse.response(res, "success", newData, 200, "Updated!");
		}
		// if update is failed
		else {
			const message = `Update data ${data.name} failed `;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function deleteSize(req, res) {
	try {
		const id = req.params.id;
		const oldData = await sizesModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}
		const result = await sizesModel.deleteData(id);
		if (result.affectedRows > 0) {
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
async function getSizeById(req, res) {
	try {
		const id = req.params.id;
		const result = await sizesModel.getDataById(id);
		
		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	postSize,
	patchSize,
	deleteSize,
	getSizes,
	getSizeById,
}