/**
 * A module exporting functions to access the bank database.
 */
"use strict";

module.exports = {
    showCategories: showCategories,
    showProducts: showProducts,
    createProduct: createProduct,
    viewProducts: viewProducts,
    showProductView: showProductView,
    updateProduct: updateProduct,
    deleteProduct: deleteProduct,
    showLog: showLog,
    showShelf: showShelf,
    showInventory: showInventory,
    filterInventory: filterInventory,
    addInv: addInv,
    delInv: delInv
};

const mysql  = require("promise-mysql");
const config = require("../config/db/eshop.json");
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



/**
 * Create a new product.
 *
 * @async
 * @param {string} name Name of product.
 * @param {string} pris Products price.
 * @param {string} bild Link to product image.
 * @param {string} info info about product.
 *
 * @returns {void}
 */
async function createProduct(name, pris, bild, info) {
    let sql = `CALL create_product(?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [name, pris, bild, info]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}



/**
 * Show all products.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewProducts() {
    let sql = `CALL show_produkt_table();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Update product.
 *
 * @async
 * @param {string} id      The id of the product to be updated.
 * @param {string} name    The updated name of the product.
 * @param {string} pris    The updated price of the product.
 * @param {string} bild    The updated bild link of the product.
 * @param {string} info    The updated info of the product.
 *
 * @returns {void}
 */
async function updateProduct(id, namn, pris, bild, info) {
    let sql = `CALL update_product(?, ?, ?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, namn, pris, bild, info]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}



/**
 * Delete a product.
 *
 * @async
 * @param {string} id The id of the account.
 *
 * @returns {void}
 */
async function deleteProduct(id) {
    let sql = `CALL delete_product(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}



/**
 * Show a specific products details.
 *
 * @async
 * @param {string} id A id of the account.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProductView(id) {
    let sql = `CALL show_produkt_info(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}




/**
 * Show all the categories.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCategories() {
    let sql = `CALL show_categories();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}




/**
 * Show all the products with categories and stock details.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProducts() {
    let sql = `CALL show_products();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * show log with limit
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showLog(num) {
    let sql = `CALL show_log(?);`;
    let res;

    res = await db.query(sql, [num]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.\n`);

    return res[0];
}

/**
 * show available shelves
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showShelf(num) {
    let sql = `CALL show_shelf();`;
    let res;

    res = await db.query(sql, [num]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.\n`);

    return res[0];
}



/**
 * show inventory
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showInventory() {
    let sql = `CALL show_inventory();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.\n`);

    return res[0];
}



/**
 * show inventory filtered
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function filterInventory(fltr) {
    let sql = `CALL filter_inventory(?);`;
    let res;

    res = await db.query(sql, [fltr]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.\n`);

    return res[0];
}



/**
 * add inventory
 *
 * @async
 */
async function addInv(product, shelf, num) {
    let sql = `CALL add_inv(?, ?, ?);`;

    await db.query(sql, [product, shelf, num]);
}



/**
 * add inventory
 *
 * @async
 */
async function delInv(product, shelf, num) {
    let sql = `CALL del_inv(?, ?, ?);`;

    await db.query(sql, [product, shelf, num]);
}
