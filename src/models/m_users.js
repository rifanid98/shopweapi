/**
 * Config MySQL
 * .
 * load config mysql
 */
const conn = require('../helpers/mysql');

/**
 * Helpers
 */
const myHelpers = require('../helpers/myHelpers');

/**
 * CRUD
 */
async function getData(filters, totalData, fields) {
  const sqlQuery = "SELECT * FROM `users` ";
  const query = myHelpers.createQuery(sqlQuery, filters, totalData, fields)
  return new Promise((resolve, reject) => {
    conn.query(query.sqlQuery, function (error, result) {
      if (error) {
        reject(error);
      }

      const newResult = {
        totalPage: query.totalPage,
        result
      }
      result.map(data => delete data.password)
      return Object.keys(filters.pagination).length > 0 ? resolve(newResult) : resolve(result);
    })
  })
}

function addData(data) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "INSERT INTO users SET ?";
    conn.query(sqlQuery, data, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function updateData(data, id) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "UPDATE users SET ? WHERE id = ?";
    conn.query(sqlQuery, [data, id], function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function deleteData(id) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "DELETE FROM users WHERE id = ?";
    conn.query(sqlQuery, id, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

/**
 * Another CRUD
 */
function getDataById(id) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "SELECT * FROM users WHERE id = ?";
    conn.query(sqlQuery, id, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function getDataByName(name) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "SELECT * FROM users WHERE username = ?";
    conn.query(sqlQuery, name, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function getDataUserOrders(id) {
  return new Promise((resolve, reject) => {
    // belum dijoin dengan tabel payments dan tabel shipments
    const sqlQuery = `
    SELECT
      o.id AS order_id,
      o.user_id,
      o.tracking_number,
      o.address,
      SUM(do.quantity) AS quantity,
      SUM(do.sub_total) AS total,
      o.updated_at
    FROM 
      detail_order AS do 
    INNER JOIN 
      orders AS o 
    ON 
      o.id=do.order_id
    WHERE 
      o.user_id = ?
    GROUP BY 
      o.id
    `;
    conn.query(sqlQuery, id, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function getDataDetailUserOrders(user_id, order_id) {
  return new Promise((resolve, reject) => {
    const sqlQuery = `
    SELECT 
      o.id AS order_id,
      o.user_id,
      do.id AS detail_order_id,
      do.size,
      do.color,
      do.price,
      do.quantity,
      do.sub_total,
      p.id AS product_id,
      p.name AS product_name,
      p.image,
      b.name AS brand_name,
      c.name AS category_name

    FROM 
        categories AS c 
      INNER JOIN 
        products AS p 
      INNER JOIN 
        brands AS b 
      ON 
        c.id=p.category_id 
      AND 
        b.id=p.brand_id

      INNER JOIN 
        detail_order AS do 
      ON 
        p.id=do.product_id 

      INNER JOIN 
        orders AS o 
      ON 
        o.id=do.order_id

    WHERE 
      o.user_id = ? 
    AND 
      do.order_id = ?

    GROUP BY p.id
    `;
    conn.query(sqlQuery, [user_id, order_id], function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}


function getFieldsName() {
  return new Promise((resolve, reject) => {
    conn.query(`DESCRIBE users`, function (error, result) {
      //      conn.query(`DESCRIBE users`, function (error, result) {
      if (error) {
        reject(error);
      }
      let fields = {};
      result.forEach(field => {
        fields[field.Field] = field.Field;
      });
      resolve(fields);
    })
  })

}

function getTotalData() {
  return new Promise((resolve, reject) => {
    conn.query(`SELECT COUNT(id) AS total_data FROM users`, function (error, result) {
      //      conn.query(`DESCRIBE users`, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result[0].total_data);
    })
  })

}
module.exports = {
  getData,
  addData,
  updateData,
  deleteData,
  getDataById,
  getDataByName,
  getDataUserOrders,
  getDataDetailUserOrders,
  getFieldsName,
  getTotalData
}