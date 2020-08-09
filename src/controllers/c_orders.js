/**
 * Model
 * .
 * Load Model
 */
const ordersModel = require("../models/m_orders");
const detailOrderModel = require("../models/m_detail_order");
const productsModel = require("../models/m_products");

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

// moment
const moment = require('moment');
const { addData } = require("../models/m_orders");


/**
 * CRUD
 */
async function getOrders(req, res) {
	try {
		const filters = req.query;
		const fields = await ordersModel.getFieldsName();
		const totalData = await ordersModel.getTotalData();
		const generatedFilters = myHelpers.generateFilters(filters, fields);
		const result = await ordersModel.getData(generatedFilters, totalData, fields);
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

async function postOrder(req, res) {
	try {
		const body = req.body;
		// Joi validation
		let data = {
			user_id: body.user_id,
			address: body.address,
			payment_id: body.payment_id
		}
		const fieldToPatch = Object.keys(data);
		await validate.validateOrders(data, fieldToPatch);

		// generate tracking number
		const randomNumber = Math.floor(Math.random() * 90000) + 10000;
		const today = moment(new Date()).format("DDMMYYYY")
		const tracking_number = `${body.user_id}${randomNumber}${today}`;
		data.tracking_number = tracking_number;

		// get product id from client
		let product_id = [];
		let userQuantities = [];
		body.detail_order.map(detail_order => {
			product_id.push(detail_order.product_id);
			userQuantities.push(detail_order.quantity);
		})
		// get product quantity based on data sent by client
		const products = await productsModel.getDataById(product_id);
		let currentQuantities = [];
		products.map(product => {
			currentQuantities.push(product.quantity);
		})
		// prepare reduced quantity data
		let quantities = [];
		currentQuantities.map((quantity, index) => {
			const obj = { quantity: `${quantity - userQuantities[index]}` };
			quantities.push(obj);
		})
		// reduce quantity
		const updateProducts = await productsModel.updateDataArray(quantities, product_id)
		// insert orders
		const addOrders = await ordersModel.addData(data);
		// prepare detail order data
		const order_id = addOrders.insertId;
		let detailOrder = [];
		body.detail_order.map((detail, index) => {
			detailOrder.push({
				order_id: order_id,
				...body.detail_order[index]
			})
		})
		// insert detail order
		const addDetailOrder = await detailOrderModel.addDataArray(detailOrder)
		let updateProductsStatus = { affectedRows: 0 };
		updateProducts.map(update => {
			if (update.affectedRows > 0) updateProductsStatus.affectedRows += 1;
		})
		if (updateProductsStatus.affectedRows > 0 && addOrders.affectedRows > 0 && addDetailOrder.affectedRows > 0) {
			const setData = {
				orders: {
					id: addOrders.insertId
				},
				detail_order: {
					id: addDetailOrder.insertId,
					message: `(+${body.detail_order.length}) datas`
				}
			}
			return myResponse.response(res, "success", setData, 201, "Created!");
		} else {
			const message = `Add data failed`;
			return myResponse.response(res, "failed", "", 500, message);
		}
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

async function patchOrder(req, res) {
	try {
		// get data to validate
		const fieldToPatch = Object.keys(req.body);
		await validate.validateOrders(req.body, fieldToPatch);

		// checking if data is exists or not
		const id = req.params.id;
		const oldData = await ordersModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}

		// checking if order want to change the name of order
		const body = req.body;
		if (body.name !== undefined) {
			const checkOrder = await ordersModel.getDataByName(body.name);
			if (checkOrder.length > 0) {
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

		// update the order data
		const result = await ordersModel.updateData(data, id);

		// prepare the respond data
		const newData = {
			order_id: id,
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

async function deleteOrder(req, res) {
	try {
		const id = req.params.id;
		const oldData = await ordersModel.getDataById(id);
		if (oldData.length < 1) {
			const message = `Data with id ${id} not found`;
			return myResponse.response(res, "failed", "", 404, message);
		}
		const result = await ordersModel.deleteData(id);
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
async function getOrderById(req, res) {
	try {
		const id = req.params.id;
		const result = await ordersModel.getDataById(id);
		
		return myResponse.response(res, "success", result, 200, 'Ok');
	} catch (error) {
		console.log(error);
		return myResponse.response(res, "failed", "", 500, errorMessage.myErrorMessage(error, {}));
	}
}

module.exports = {
	postOrder,
	patchOrder,
	deleteOrder,
	getOrders,
	getOrderById,
}