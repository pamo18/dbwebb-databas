/**
 * Show all teachers from the school db and show as a table
 *
 * @author Paul Moreland
 */
"use strict";
const mysql  = require("promise-mysql");
const config = require("./config.json");
let school = require("./school.js");

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;

    str = await school.viewTeachers(db);
    console.info(str);

    db.end();
})();
