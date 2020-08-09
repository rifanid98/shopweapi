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
const colorsRouter = require('./r_colors');
const sizesRouter = require('./r_sizes');
const brandsRouter = require('./r_brands');
const categoriesRouter = require('./r_categories');
const productsRouter = require('./r_products');

/**
 * Fire the router
 */
router.use('/auth', validationMiddleware.xssEscape, authRouter);
router.use('/users', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, usersRouter);
router.use('/colors', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, colorsRouter);
router.use('/sizes', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, sizesRouter);
router.use('/brands', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, brandsRouter);
router.use('/categories', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, categoriesRouter);
router.use('/products', validationMiddleware.xssEscape, authMiddleware.verifyJwtToken, productsRouter);


module.exports = router;