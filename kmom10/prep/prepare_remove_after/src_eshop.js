/**
 * A module exporting functions to access the eshop database.
 */
"use strict";

module.exports = {
    showCategories: showCategories,
    showCategory: showCategory,
    showProducts: showProducts,
    showProductCat: showProductCat,
    createProduct: createProduct,
    viewProducts: viewProducts,
    showProductView: showProductView,
    updateProduct: updateProduct,
    addCategory: addCategory,
    deleteProduct: deleteProduct,
    showLog: showLog,
    showShelf: showShelf,
    showInventory: showInventory,
    filterInventory: filterInventory,
    addInv: addInv,
    delInv: delInv,
    showCustomers: showCustomers,
    createOrder: createOrder,
    showOrders: showOrders,
    showOrder: showOrder,
    buildOrder: buildOrder,
    viewOrder: viewOrder,
    placeOrder: placeOrder,
    deleteOrder: deleteOrder,
    unDeleteOrder: unDeleteOrder,
    viewPlocklista: viewPlocklista,
    sendOrder: sendOrder,
    viewInvoice: viewInvoice,
    invoicePaid: invoicePaid,
    stockUpdate: stockUpdate,
    viewLogs: viewLogs,
    viewLogsFiltered: viewLogsFiltered
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
 * Add category.
 *
 * @async
 * @param {string} categories New product categories.
 *
 * @returns {void}
 */
async function addCategory(id, categories) {
    let sqlAdd = `CALL add_category(?, ?);`;
    let sqlRemove = `CALL remove_category(?, ?);`;
    let currentCat = await showProductCat(id);
    let removeList = [];
    let toRemove;
    let c;
    let r;

    for (c in currentCat) {
        removeList.push(currentCat[c].kategori);
    }
    if (typeof categories == "object") {
        for (c in categories) {
            if (removeList.includes(categories[c])) {
                console.info(categories[c] + " already chosen");
                toRemove = removeList.indexOf(categories[c]);
                removeList.splice(toRemove, 1);
            } else {
                await db.query(sqlAdd, [id, categories[c]]);
                console.info("Added: " + categories[c]);
            }
        }
    } else if (typeof categories == "string") {
        if (removeList.includes(categories)) {
            console.info(categories + " already chosen");
            toRemove = removeList.indexOf(categories);
            removeList.splice(toRemove, 1);
        } else {
            await db.query(sqlAdd, [id, categories]);
            console.info("Added: " + categories);
        }
    }
    if (removeList.length > 0) {
        for (r in removeList) {
            console.info(removeList[r] + " removed");
            await db.query(sqlRemove, [id, removeList[r]]);
        }
    }
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
 * Show specific category.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCategory(type) {
    let sql = `CALL show_category(?);`;
    let res;

    res = await db.query(sql, [type]);
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
 * Show all the products with categories and stock details.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showProductCat(id) {
    let sql = `CALL show_produkt_kategori(?);`;
    let res;

    res = await db.query(sql, [id]);
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
 * delete inventory
 *
 * @async
 */
async function delInv(product, shelf, num) {
    let sql = `CALL del_inv(?, ?, ?);`;

    await db.query(sql, [product, shelf, num]);
}



/**
 * Show all the customers.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCustomers() {
    let sql = `CALL show_customers();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all the orders.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOrders() {
    let sql = `CALL show_orders();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show specific order.
 *
 * @async
 * @param {string} id order id.
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showOrder(id) {
    let sql = `CALL show_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Create a new order.
 *
 * @async
 * @param {string} id order id.
 *
 * @returns {void}
 */
async function createOrder(id) {
    let sql = `CALL create_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}



/**
 * Update order.
 *
 * @async
 * @param {string} id       The id of the order to be updated.
 * @param {string} product  The product id.
 * @param {string} quantity The quantity ordered.
 *
 * @returns {void}
 */
async function buildOrder(id, product, quantity) {
    let sql = `CALL build_order(?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, product, quantity]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);
}



/**
 * View specific order details.
 *
 * @async
 * @param {string} id id of order.
 * @returns {RowDataPacket} Resultset from the query.
 *
 */
async function viewOrder(id) {
    let sql = `CALL view_order(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Change status.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {void}
 */
async function placeOrder(id) {
    let sql = `CALL place_order(?);`;

    await db.query(sql, [id]);
}



/**
 * Change status delete order.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {void}
 */
async function deleteOrder(id) {
    let sql = `CALL delete_order(?);`;

    await db.query(sql, [id]);
}



/**
 * Change status undelete order.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {void}
 */
async function unDeleteOrder(id) {
    let sql = `CALL un_delete_order(?);`;

    await db.query(sql, [id]);
}



/**
 * View plocklista.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewPlocklista(id) {
    let sql = `CALL view_plocklista(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Send order.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {void}
 */
async function sendOrder(id) {
    let sqlp1 = `CALL send_order(?);`;
    let sqlp2 = `CALL gen_invoice(?, ?, ?);`;
    let sqlp3 = `CALL fill_invoice(?, ?, ?, ?);`;
    let getOrderStatus;
    let orderStatus;
    let orderDetails;
    let sentDate;
    let customer;
    let getInvoiceId;
    let invoiceId;
    let r;
    let pn;
    let pq;
    let pp;

    getOrderStatus = await viewOrder(id);
    orderStatus = getOrderStatus[0].order_status;
    if (orderStatus != "Skickad") {
        console.info(`\nSending order ${id}\n`);
        await db.query(sqlp1, [id]);
        orderDetails = await viewOrder(id);
        sentDate = orderDetails[0].sent;
        customer = orderDetails[0].kund_id;
        getInvoiceId = await db.query(sqlp2, [sentDate, id, customer]);
        invoiceId = getInvoiceId[0];
        invoiceId = invoiceId[0].id;
        for (r in orderDetails) {
            pn = orderDetails[r].produkt_namn;
            pq = orderDetails[r].kvantitet;
            pp = orderDetails[r].produkt_pris;
            await db.query(sqlp3, [invoiceId, pn, pq, pp]);
        }
    } else {
        console.info("\nOrder already sent!\n");
    }
}



/**
 * View invoice.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewInvoice(id) {
    let sql = `CALL view_invoice(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Mark invoice as paid.
 *
 * @async
 * @param {string} id id of order.
 *
 * @returns {void}
 */
async function invoicePaid(id, datePaid) {
    let sql = `CALL invoice_paid(?, ?);`;

    await db.query(sql, [id, datePaid]);
}



/**
 * Stock update.
 *
 * @async
 * @param {string} id id of order.
 * @param {string} orderAntal amount ordered.
 *
 * @returns {void}
 */
async function stockUpdate(id, orderAntal) {
    let sql = `CALL stock_update(?);`;
    let res;
    let shelf;
    let stock;

    res = await db.query(sql, [id]);
    res = res[0];

    for (const row of res) {
        //await delInv(product, shelf, num)
        shelf = row.hylla_id;
        stock = row.antal;
        if (orderAntal <= stock) {
            await delInv(id, shelf, orderAntal);
            orderAntal = 0;
            break;
        } else {
            await delInv(id, shelf, stock);
            orderAntal -= stock;
        }
    }
    if (orderAntal) {
        await delInv(id, shelf, orderAntal);
    }
}



/**
 * View log.
 *
 * @async
 *
 * @returns {RowDataPacket} Resultset from the query.
 */
async function viewLogs() {
    let sql = `CALL view_log();`;
    let res;

    res = await db.query(sql);
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
async function viewLogsFiltered(fltr) {
    let sql = `CALL view_log_filter(?);`;
    let res;

    res = await db.query(sql, [fltr]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
