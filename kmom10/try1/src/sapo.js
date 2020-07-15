/**
 * Paul Moreland
 * pamo18
 * 2019/03/28
 */

/**
 * A module exporting functions to access the exam database.
 */
"use strict";

module.exports = {
    viewAllLogg: viewAllLogg,
    viewShortLogg: viewShortLogg,
    viewLogsFiltered: viewLogsFiltered,
    viewShortFiltered: viewShortFiltered,
    viewPerson: viewPerson
};

const mysql  = require("promise-mysql");
const config = require("../config/db/sapo.json");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**-----------------------------------------------------------------------------
 * CRUD Create
------------------------------------------------------------------------------*/

/**-----------------------------------------------------------------------------
 * CRUD Read
------------------------------------------------------------------------------*/

/**
 * Read data.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewAllLogg() {
    let sql = `CALL show_all_logg();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Read data.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewShortLogg() {
    let sql = `CALL show_short_logg();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Read data.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewPerson() {
    let sql = `CALL view_person();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**-----------------------------------------------------------------------------
 * CRUD Update
------------------------------------------------------------------------------*/

/**-----------------------------------------------------------------------------
 * CRUD Delete
------------------------------------------------------------------------------*/

/**-----------------------------------------------------------------------------
 * Other functions
------------------------------------------------------------------------------*/

/**
 * View log with filter.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewLogsFiltered(fltr) {
    let sql = `CALL view_log_filter(?);`;
    let res;

    res = await db.query(sql, [fltr]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * View log with filter.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewShortFiltered(fltr) {
    let sql = `CALL view_short_filter(?);`;
    let res;

    res = await db.query(sql, [fltr]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
