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
const brandsController = require('../controllers/c_brands');


/**
 * Main CRUD
 */
// Get All Brands
router.get('/', authMiddleware.checkRole([3, 2, 1]), brandsController.getBrands);
// Post a Brand
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), brandsController.postBrand);
// Patch a Brand
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), brandsController.patchBrand);
// Delete a Brand
router.delete('/:id', authMiddleware.checkRole([1]), brandsController.deleteBrand);

/**
 * Other CRUD
 */
// Get Brand By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), brandsController.getBrandById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. Brand
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getBrands);

module.exports = router;