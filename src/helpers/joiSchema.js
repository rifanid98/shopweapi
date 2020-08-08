/**
 * JOI!
 */
const Joi = require('joi');

/**
 * Custom Joi Error Handling
 */
function myJoiError(error = {}) {
	const joiError = error.error.details[0];
	const errorMessage = {
		joiError: 'joi',
		message: joiError.message
	};

	return errorMessage;
}

module.exports = {
	/**
	 * Dynamic Schema Example
	 */
	validateBooks: function (book, field = null) {
		const joiSchema = {
			// bookImage: Joi.required(),
			title: Joi.string().trim().min(3).required(),
			description: Joi.string().trim().min(3).required(),
			author_id: Joi.number().min(1).required(),
			status: Joi.number().min(0).max(1).required(),
			quantity: Joi.number().min(1).required(),
			genre_id: Joi.number().min(0).required()
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(book, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(book, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
	validateColors: function (color, field = null) {
		const joiSchema = {
			// bookImage: Joi.required(),
			name: Joi.string().trim().min(3).required(),
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(color, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(color, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
	validateSizes: function (size, field = null) {
		const joiSchema = {
			// bookImage: Joi.required(),
			name: Joi.string().trim().min(1).required(),
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(size, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(size, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},

	/**
	 * Authentication Schemas
	 */
	validateRegister: function (register, field = null) {
		const joiSchema = {
			username: Joi.string().trim().min(3).required(),
			full_name: Joi.string().trim().min(3).required(),
			email: Joi.string().email({ minDomainAtoms: 2 }),
			password: Joi.string().trim().min(3).required(),
			role: Joi.number().min(1).required(),
			otp: Joi.number().min(6).required(),
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(register, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(register, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
	validateLogin: function (login, field = null) {
		const joiSchema = {
			username: Joi.string().trim().min(3).required(),
			email: Joi.string().email({ minDomainAtoms: 2 }),
			password: Joi.string().trim().min(3).required()
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(user, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(login, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
	validateUsers: function (user, field = null) {
		const joiSchema = {
			username: Joi.string().trim().min(3).required(),
			full_name: Joi.string().trim().min(3).required(),
			birth: Joi.date().max('now').required(),
			email: Joi.string().email({ minDomainAtoms: 2 }),
			password: Joi.string().trim().min(3).required(),
			phone: Joi.string().trim().min(4).max(15).required(),
			address: Joi.string().trim().min(3).required(),
			address_active: Joi.number().min(0).required(),
			role: Joi.number().min(1).max(3).positive().required(),
			role: Joi.number().min(1).max(3).required(),
			access_key: Joi.string().trim().min(3).required()
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(user, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(user, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
	validateRefreshToken: function (userData) {
		const joiSchema = {
			tokenRefresh: Joi.string().trim().min(3).required()
		};

		return new Promise((resolve, reject) => {
			const error = Joi.validate(userData, joiSchema);

			if (error.error != null) {
				reject(myJoiError(error));
			}
			resolve();
		});
	},
	validateResetPassword: function (reset, field = null) {
		const joiSchema = {
			// bookImage: Joi.required(),
			password: Joi.string().alphanum().trim().min(1).required(),
			otp: Joi.number().min(6).max(6).required(),
			id: Joi.number().min(1).required()
		};

		if (!field) {
			return new Promise((resolve, reject) => {
				const error = Joi.validate(reset, joiSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		} else {
			const dynamicSchema = Object.keys(joiSchema)
				.filter(key => field.includes(key))
				.reduce((obj, key) => {
					obj[key] = joiSchema[key];
					return obj;
				}, {});
			return new Promise((resolve, reject) => {
				const error = Joi.validate(reset, dynamicSchema);

				if (error.error != null) {
					reject(myJoiError(error));
				}
				resolve();
			});
		}
	},
}
