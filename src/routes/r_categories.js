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
const categoriesController = require('../controllers/c_categories');


/**
 * Main CRUD
 */
// Get All Categories
router.get('/', authMiddleware.checkRole([3, 2, 1]), categoriesController.getCategories);
// Post a Category
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), categoriesController.postCategory);
// Patch a Category
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), categoriesController.patchCategory);
// Delete a Category
router.delete('/:id', authMiddleware.checkRole([1]), categoriesController.deleteCategory);

/**
 * Other CRUD
 */
// Get Category By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), categoriesController.getCategoryById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Category
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getCategories);

module.exports = router;