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
const colorsController = require('../controllers/c_colors');


/**
 * Main CRUD
 */
// Get All Colors
router.get('/', authMiddleware.checkRole([3, 2, 1]), colorsController.getColors);
// Post a Color
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), colorsController.postColor);
// Patch a Color
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), colorsController.patchColor);
// Delete a Color
router.delete('/:id', authMiddleware.checkRole([1]), colorsController.deleteColor);

/**
 * Other CRUD
 */
// Get Color By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), colorsController.getColorById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Color
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getColors);

module.exports = router;