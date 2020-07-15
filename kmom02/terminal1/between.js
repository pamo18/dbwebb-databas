/**
 * Search school db and compare lon and kompetens between min and max values
 *
 * @author Paul Moreland
 */
"use strict";
const mysql  = require("promise-mysql");
const config = require("./config.json");
let school = require("./school.js");

// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Promisify rl.question to question
const util = require("util");

rl.question[util.promisify.custom] = (arg) => {
    return new Promise((resolve) => {
        rl.question(arg, resolve);
    });
};
const question = util.promisify(rl.question);

/**
 * Main function.
 *
 * @async
 * @returns void
 */
(async function() {
    const db = await mysql.createConnection(config);
    let str;
    let min;
    let max;

    min = await question("Enter minimum value -> ");
    max = await question("Enter maximum value -> ");

    str = await school.compareTeachers(db, min, max);
    console.info(str);

    rl.close();
    db.end();
})();
