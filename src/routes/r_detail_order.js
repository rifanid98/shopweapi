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
const detailOrderController = require('../controllers/c_detail_order');


/**
 * Main CRUD
 */
// Get All DetailOrder
router.get('/', authMiddleware.checkRole([3, 2, 1]), detailOrderController.getDetailOrder);
// Post a DetailOrder
router.post('/', authMiddleware.checkRole([2, 1]), upload.none(), detailOrderController.postDetailOrder);
// Patch a DetailOrder
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.none(), detailOrderController.patchDetailOrder);
// Delete a DetailOrder
router.delete('/:id', authMiddleware.checkRole([1]), detailOrderController.deleteDetailOrder);

/**
 * Other CRUD
 */
// Get DetailOrder By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), detailOrderController.getDetailOrderById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. DetailOrder
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getDetailOrder);

module.exports = router;