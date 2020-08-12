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
const productsController = require('../controllers/c_products');


/**
 * Main CRUD
 */
// Get All Products
router.get('/', productsController.getProducts);
// Post a Product
router.post('/', authMiddleware.verifyJwtToken, authMiddleware.checkRole([2, 1]), upload.single('image'), productsController.postProduct);
// Patch a Product
router.patch('/:id', authMiddleware.verifyJwtToken, authMiddleware.checkRole([2, 1]), upload.single('image'), productsController.patchProduct);
// Delete a Product
router.delete('/:id', authMiddleware.verifyJwtToken, authMiddleware.checkRole([1]), productsController.deleteProduct);

/**
 * Other CRUD
 */
// Get Product By ID
router.get('/:id', productsController.getProductById);
/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Product
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getProducts);

module.exports = router;