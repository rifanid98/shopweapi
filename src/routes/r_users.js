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
const usersController = require('../controllers/c_users');


/**
 * Main CRUD
 */
// Get All Users
router.get('/', authMiddleware.checkRole([3, 2, 1]), usersController.getUsers);
// Post a User
router.post('/', authMiddleware.checkRole([2, 1]), upload.single('image'), usersController.postUser);
// Patch a User
router.patch('/:id', authMiddleware.checkRole([2, 1]), upload.single('image'), usersController.patchUser);
// Delete a User
router.delete('/:id', authMiddleware.checkRole([1]), usersController.deleteUser);

/**
 * Other CRUD
 */
// Get User By ID
router.get('/:id', authMiddleware.checkRole([3, 2, 1]), usersController.getUserById);
// Get User Orders
router.get('/:id/orders', authMiddleware.checkRole([3, 2, 1]), usersController.getUserOrders);
// Get User Orders
router.get('/:user_id/orders/:order_id', authMiddleware.checkRole([3, 2, 1]), usersController.getDetailUserOrders);
/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. User
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getUsers);

module.exports = router;