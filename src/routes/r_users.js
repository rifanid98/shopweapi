/**
 * ExpressJs FW
 */
// import express framework
const express = require('express');

// instance of express router
const router = express.Router();

// import multer upload helper
const upload = require('../helpers/upload');

/**
 * Controllers
 */
// load the controller
const usersController = require('../controllers/c_users');


/**
 * Main CRUD
 */
// Get All Users
router.get('/', usersController.getUsers);
// Post a User
router.post('/', upload.single('image'), usersController.postUser);
// Patch a User
router.patch('/:id', upload.single('image'), usersController.patchUser);
// Delete a User
router.delete('/:id', usersController.deleteUser);

/**
 * Other CRUD
 */
// Get User By ID
router.get('/:id', usersController.getUserById);

/**
 * Use authMiddleware example.
 * 1. Admin
 * 2. Staff
 * 3. User
 */
// router.get('/', authMiddleware.checkRole([3, 2, 1]), booksController.getUsers);

module.exports = router;