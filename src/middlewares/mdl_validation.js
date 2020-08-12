// import xss escape characters
require('../helpers/xssEscape');

module.exports = {
    xssEscape: function (req, res, next) {
        if (req.query) {
            for (key in req.query) {
                req.query[key] = req.query[key].escape();
            }
        }
        if (req.body) {
            if (Array.isArray(req.body)) {
                for (key in req.body) {
                    req.body[key] = req.body[key].escape();
                }
            }
        }
        if (req.params) {
            for (key in req.params) {
                req.params[key] = req.params[key].escape();
            }
        }
        // console.log(req.query);
        
        next();
    }
}