/**
 * ExpressJs FW
 */
// import express framework
const express = require('express');
// instance of express router
const router = express.Router();

// import middlewares
const authMiddleware = require('../middlewares/mdl_auth');
const validationMiddleware = require('../middlewares/mdl_validation');

/**
 * Load All Routes
 */
const authRouter = require('./r_auth');
const usersRouter = require('./r_users');

/**
 * Fire the router
 */
router.use('/auth', validationMiddleware.xssEscape, authRouter);
router.use('/users', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, usersRouter);

module.exports = router;