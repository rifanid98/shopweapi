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
  // const sqlQuery = "SELECT * FROM `products` ";
  const sqlQuery = `
  SELECT 
    p.* ,
    c.name AS category_name,
    b.name AS brand_name
  FROM 
    products AS p
  INNER JOIN 
    categories AS c
  ON 
    c.id = p.category_id
  AND 
    p.quantity <> 0

  INNER JOIN 
   brands AS b
  ON b.id = p.brand_id 
  ` ;

  const ANDExceptions = ['sizes', 'colors', 'categories'];
  const groups = ['p.id'];
  const customFields = fields;
  delete customFields.id;
  delete customFields.name;
  delete customFields.created_at;
  delete customFields.updated_at;
  customFields['c.name'] = 'c.name';
  customFields['p.name'] = 'p.name';
  customFields['p.name'] = 'p.name';
  customFields['p.created_at'] = 'p.created_at';
  customFields['p.updated_at'] = 'p.updated_at';
  const query = myHelpers.createQuery(sqlQuery, filters, totalData, fields, groups, ANDExceptions, customFields);
  return new Promise((resolve, reject) => {
    conn.query(query.sqlQuery, function (error, result) {
      if (error) {
        reject(error);
      }

      const newResult = {
        totalPage: query.totalPage,
        result
      }
      return Object.keys(filters.pagination).length > 0 ? resolve(newResult) : resolve(result);
    })
  })
}

function addData(data) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "INSERT INTO products SET ?";
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
    const sqlQuery = "UPDATE products SET ? WHERE id = ?";
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
    const sqlQuery = "DELETE FROM products WHERE id = ?";
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
    let sqlQuery = '';
    if (Array.isArray(id)) {
      sqlQuery = "SELECT * FROM products WHERE id IN(?)";
    } else {
      sqlQuery = "SELECT * FROM products WHERE id = ?";
    }
    conn.query(sqlQuery, [id], function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
    })
  })
}

function getDataByName(name) {
  return new Promise((resolve, reject) => {
    const sqlQuery = "SELECT * FROM products WHERE name = ?";
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
    conn.query(`DESCRIBE products`, function (error, result) {
      //      conn.query(`DESCRIBE products`, function (error, result) {
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
    conn.query(`SELECT COUNT(id) AS total_data FROM products`, function (error, result) {
      //      conn.query(`DESCRIBE products`, function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result[0].total_data);
    })
  })

}

async function getPopularData(filters, totalData, fields) {
  // const sqlQuery = "SELECT * FROM `products` ";
  const sqlQuery = `
  SELECT
    p.*,
    b.name AS brand_name,
    SUM(do.quantity) AS top_products
  FROM 
    detail_order AS do 
  INNER JOIN 
    products AS p 
  ON 
    p.id=do.product_id
  AND
    p.quantity <> 0

  INNER JOIN 
    brands AS b
  ON 
    b.id=p.brand_id
  ` ;
  const ANDExceptions = ['sizes', 'colors', 'categories'];
  const groups = ['do.product_id'];
  const customFields = fields;
  delete customFields.id;
  delete customFields.name;
  delete customFields.created_at;
  delete customFields.updated_at;
  customFields['c.name'] = 'c.name';
  customFields['p.name'] = 'p.name';
  customFields['p.name'] = 'p.name';
  customFields['p.created_at'] = 'p.created_at';
  customFields['p.updated_at'] = 'p.updated_at';
  const query = myHelpers.createQuery(sqlQuery, filters, totalData, fields, groups, ANDExceptions, customFields);
  // const query = myHelpers.createQuery(sqlQuery, filters, totalData, fields);
  return new Promise((resolve, reject) => {
    conn.query(query.sqlQuery, function (error, result) {
      if (error) {
        reject(error);
      }
      const newResult = {
        totalPage: query.totalPage,
        result
      }
      return Object.keys(filters.pagination).length > 0 ? resolve(newResult) : resolve(result);
    })
  })
}

function updateDataArray(data, id) {
  return new Promise((resolve, reject) => {
    let sqlQuery = '';
    const datas = data;
    let i = 0;
    datas.map((data, index) => {
      sqlQuery += (i === datas.length)
        ? `UPDATE products SET ${myHelpers.createSQLSETFromObj(data)} WHERE id = ${id[index]}`
        : `UPDATE products SET ${myHelpers.createSQLSETFromObj(data)} WHERE id = ${id[index]}; `
      i++;
    })
    // const sqlQuery = "UPDATE products SET ? WHERE id = ?";
    conn.query(sqlQuery, [data, id], function (error, result) {
      if (error) {
        reject(error);
      }
      resolve(result);
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
  getTotalData,
  getPopularData,
  updateDataArray
}