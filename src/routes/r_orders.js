/**
 * ExpressJs FW
 */
// import express framework
const express = require('express');

// instance of express router
const router = express.Router();

// import multer upload helper
const upload = require('../helpers/upload');

// import middlewares
const authMiddleware = require('../middlewares/mdl_auth');

/**
 * Controllers
 */
// load the controller
const ordersController = require('../controllers/c_orders');


/**
 * Main CRUD
 */
// Get All Orders
router.get('/', authMiddleware.checkRole([3, 2, 1]), ordersController.getOrders);
// Post a Order
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), ordersController.postOrder);
// Patch a Order
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), ordersController.patchOrder);
// Delete a Order
router.delete('/:id', authMiddleware.checkRole([1]), ordersController.deleteOrder);

/**
 * Other CRUD
 */
// Get Order By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), ordersController.getOrderById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Order
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getOrders);

module.exports = router;