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
  const sqlQuery = "SELECT * FROM `colors` ";
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
    const sqlQuery = "INSERT INTO colors SET ?";
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
    const sqlQuery = "UPDATE colors SET ? WHERE id = ?";
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
    const sqlQuery = "DELETE FROM colors WHERE id = ?";
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
    const sqlQuery = "SELECT * FROM colors WHERE id = ?";
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
    const sqlQuery = "SELECT * FROM colors WHERE name = ?";
    conn.query(sqlQuery, name, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function getFieldsName() {
  return new Promise((resolve, reject) => {
    conn.query(`DESCRIBE colors`, function (error, result) {
      //      conn.query(`DESCRIBE colors`, function (error, result) {
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
    conn.query(`SELECT COUNT(id) AS total_data FROM colors`, function (error, result) {
      //      conn.query(`DESCRIBE colors`, function (error, result) {
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
  getFieldsName,
  getTotalData
}