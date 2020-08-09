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
const paymentsController = require('../controllers/c_payments');


/**
 * Main CRUD
 */
// Get All Payments
router.get('/', authMiddleware.checkRole([3, 2, 1]), paymentsController.getPayments);
// Post a Payment
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), paymentsController.postPayment);
// Patch a Payment
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), paymentsController.patchPayment);
// Delete a Payment
router.delete('/:id', authMiddleware.checkRole([1]), paymentsController.deletePayment);

/**
 * Other CRUD
 */
// Get Payment By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), paymentsController.getPaymentById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Payment
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getPayments);

module.exports = router;