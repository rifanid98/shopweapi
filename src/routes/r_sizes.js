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
const sizesController = require('../controllers/c_sizes');


/**
 * Main CRUD
 */
// Get All Sizes
router.get('/', authMiddleware.checkRole([3, 2, 1]), sizesController.getSizes);
// Post a Size
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), sizesController.postSize);
// Patch a Size
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), sizesController.patchSize);
// Delete a Size
router.delete('/:id', authMiddleware.checkRole([1]), sizesController.deleteSize);

/**
 * Other CRUD
 */
// Get Size By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), sizesController.getSizeById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Size
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getSizes);

module.exports = router;