const mysql = require('mysql');

/**
 * Connects to a MySQL database and retrieves data from a specified table.
 * @param {string} host - The database host.
 * @param {string} user - The database user.
 * @param {string} password - The database password.
 * @param {string} database - The database name.
 * @param {string} query - The SQL query to execute.
 * @returns {Promise<Object[]>} - A promise that resolves to the query result in JSON format.
 */
async function fetchFromDatabase(host, user, password, database, query) {
  return new Promise((resolve, reject) => {

    const connection = mysql.createConnection({
      host,
      user,
      password,
      database
    });

    connection.connect((err) => {
      if (err) {
        reject(`Error connecting to database: ${err.message}`);
        return;
      }

      connection.query(query, (err, results) => {

        connection.end();

        if (err) {

          reject(`Error executing query: ${err.message}`);

          return;
        }

        resolve(results);
      });
    });
  });
}


/**
 * Search in a database.
 * @param {string} searchString - keyword search.
 * @returns {array<object>} - A array of JSON object(s).
 */

const search = async (searchString) => {
    try {
      const dbHost = process.env.DB_HOST;
      const dbUser = process.env.DB_USER;
      const dbPassword = process.env.DB_PASSWORD;
      const database = process.env.DATABASE;

      const query = '(SELECT * FROM garden_catalog WHERE CONCAT_WS("", category, name, product_id) LIKE "%' + searchString  + '%") UNION (SELECT * FROM home_catalog WHERE CONCAT_WS("", category, name, product_id) LIKE "%' + searchString + '%")';

      return await fetchFromDatabase(dbHost, dbUser, dbPassword, database, query);

    }

    catch (error) {

      return error;
    }
  }

module.exports = {

  search

};