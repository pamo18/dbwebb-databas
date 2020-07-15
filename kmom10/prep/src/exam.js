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
    createSushi: createSushi,
    createComp: createComp,
    viewAllSushi: viewAllSushi,
    viewSushi: viewSushi,
    viewAllComp: viewAllComp,
    viewComp: viewComp,
    viewCompDetails: viewCompDetails,
    viewCompSushi: viewCompSushi,
    updateSushi: updateSushi,
    updateComp: updateComp,
    deleteSushi: deleteSushi,
    deleteComp: deleteComp,
    voteCompSushi: voteCompSushi,
    addOptions: addOptions
};

const mysql  = require("promise-mysql");
const config = require("../config/db/exam.json");
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

/**
 * Create item.
 *
 * @async
 * @param {string} name
 * @param {string} details
 * @param {string} tv
 * @param {string} image

 *
 * @returns {void}
 */
async function createSushi(name, details, tv, image) {
    let sql = `CALL create_sushi(?, ?, ?, ?);`;

    await db.query(sql, [name, details, tv, image]);
}

/**
 * Create item.
 *
 * @async
 * @param {string} name
 * @param {string} details
 * @param {string} compDate

 *
 * @returns {void}
 */
async function createComp(name, details, compDate) {
    let sql = `CALL create_comp(?, ?, ?);`;

    await db.query(sql, [name, details, compDate]);
}

/**-----------------------------------------------------------------------------
 * CRUD Read
------------------------------------------------------------------------------*/

/**
 * Read data.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewAllSushi() {
    let sql = `CALL show_all_sushi();`;
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
async function viewSushi(id) {
    let sql = `CALL show_sushi(?);`;
    let res;

    res = await db.query(sql, [id]);
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
async function viewAllComp() {
    let sql = `CALL show_all_comp();`;
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
async function viewComp(id) {
    let sql = `CALL show_comp(?);`;
    let res;

    res = await db.query(sql, [id]);
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
async function viewCompDetails(id) {
    let sql = `CALL show_comp_details(?);`;
    let res;

    res = await db.query(sql, [id]);
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
async function viewCompSushi(id) {
    let sql = `CALL show_comp_sushi(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**-----------------------------------------------------------------------------
 * CRUD Update
------------------------------------------------------------------------------*/

/**
 * Update item.
 *
 * @async
 * @param {string} id
 * @param {string} name
 * @param {string} tv
 * @param {string} image
 * @param {string} details
 *
 * @returns {void}
 */
async function updateSushi(id, name, details, tv, image) {
    let sql = `CALL update_sushi(?, ?, ?, ?, ?);`;

    await db.query(sql, [id, name, details, tv, image]);
}

/**
 * Update item.
 *
 * @async
 * @param {string} id
 * @param {string} name
 * @param {string} details
 * @param {string} compDate

 *
 * @returns {void}
 */
async function updateComp(id, name, details, compDate) {
    let sql = `CALL update_comp(?, ?, ?, ?);`;

    await db.query(sql, [id, name, details, compDate]);
}

/**-----------------------------------------------------------------------------
 * CRUD Delete
------------------------------------------------------------------------------*/

/**
 * Delete item.
 *
 * @async
 * @param {string} id The id.
 *
 * @returns {void}
 */
async function deleteSushi(id) {
    let sql = `CALL delete_sushi(?);`;

    await db.query(sql, [id]);
}

/**
 * Delete item.
 *
 * @async
 * @param {string} id The id.
 *
 * @returns {void}
 */
async function deleteComp(id) {
    let sql = `CALL delete_comp(?);`;

    await db.query(sql, [id]);
}

/**-----------------------------------------------------------------------------
 * Other functions
------------------------------------------------------------------------------*/

/**
 * Vote for sushi.
 *
 * @async
 * @returns {void}
 */
async function voteCompSushi(comp, sushi) {
    let sql = `CALL vote_comp_sushi(?, ?);`;

    await db.query(sql, [comp, sushi]);
    console.log("\nYou voted for sushi: " + sushi + " in competition " + comp + "\n");
}

/**
 * Add category.
 *
 * @async
 * @param {string} categories New product categories.
 *
 * @returns {void}
 */
async function addOptions(id, options) {
    let sqlAdd = `CALL add_options(?, ?);`;
    let sqlRemove = `CALL remove_options(?, ?);`;
    let currentOptions = await viewCompSushi(id);
    let removeList = [];
    let toRemove;
    let option;
    let c;
    let r;

    for (c in currentOptions) {
        removeList.push(currentOptions[c].sushi_id);
    }
    if (typeof options == "object") {
        for (c in options) {
            option = parseInt(options[c]);
            if (removeList.includes(option)) {
                console.info(options[c] + " already chosen");
                toRemove = removeList.indexOf(option);
                removeList.splice(toRemove, 1);
            } else {
                await db.query(sqlAdd, [id, option]);
                console.info("Added: " + options[c]);
            }
        }
    } else if (typeof options == "string") {
        option = parseInt(options);
        if (removeList.includes(option)) {
            console.info(options + " already chosen");
            toRemove = removeList.indexOf(option);
            removeList.splice(toRemove, 1);
        } else {
            await db.query(sqlAdd, [id, option]);
            console.info("Added: " + options);
        }
    }
    if (removeList.length > 0) {
        for (r in removeList) {
            console.info(removeList[r] + " removed");
            await db.query(sqlRemove, [id, removeList[r]]);
        }
    }
}
