/**
 * Model
 * .
 * Load Model
 */
const brandsModel = require("../models/m_brands");

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
async function getBrands(req, res) {
	try {
		const filters = req.query;
		const fields = await brandsModel.getFieldsName();
		const totalData = await brandsModel.getTotalData();
		const generatedFilters = myHelpers.generateFilters(filters, fields);
		const result = await brandsModel.getData(generatedFilters, totalData, fields);
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

async function postBrand(req, res) {
	try {
		// Joi validation
		const fieldToPatch = Object.keys(req.body);
		await validate.validateBrands(req.body, fieldToPatch);

		const body = req.body;
		const checkBrand = await brandsModel.getDataByName(body.name);

		if (checkBrand.length > 0) {
			const message = `Duplicate data ${body.name}`;
			return myResponse.response(res, "failed", "", 409, message);
		}

		const result = await brandsModel.addData(body);
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

async function patchBrand(req, res) {
	try {
		// get data to validate
		const fieldToPatch = Object.keys(req.body);
		await validate.validateBrands(req.body, fieldToPatch);

		// checking if data is exists or not
		const id = req.params.id;
		const oldData = await brandsModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}

		// checking if brand want to change the name of brand
		const body = req.body;
		if (body.name !== undefined) {
			const checkBrand = await brandsModel.getDataByName(body.name);
			if (checkBrand.length > 0) {
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

		// update the brand data
		const result = await brandsModel.updateData(data, id);

		// prepare the respond data
		const newData = {
			brand_id: id,
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

async function deleteBrand(req, res) {
	try {
		const id = req.params.id;
		const oldData = await brandsModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}
		const result = await brandsModel.deleteData(id);
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
async function getBrandById(req, res) {
	try {
		const id = req.params.id;
		const result = await brandsModel.getDataById(id);
		
		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	postBrand,
	patchBrand,
	deleteBrand,
	getBrands,
	getBrandById,
}