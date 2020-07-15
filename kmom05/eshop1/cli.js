/**
 * PAMO Bank
 */
"use strict";
// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Import the bank module
const eshop = require("./src/eshop.js");
const cTable = require('console.table');

/**
 * Main function.
 *
 * @returns void
 */
(function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    console.log(
        "\nWelcome to CDOff!\n"
        + "Welcome to our eshop!\n"
        + "Select 'menu' for more info or 'exit' to quit.\n"
    );

    rl.setPrompt("How can i help you today? ");
    rl.prompt();
})();



/**
 * Handle input as a command and send it to a function that deals with it.
 *
 * @param {string} line The input from the user.
 *
  * @async
 * @returns {void}
 */
async function handleInput(line) {
    let split;
    let cmd;
    let part1;
    let part2;
    let part3;

    line = line.trim();
    split = line.split(" ");
    cmd = split[0];
    part1 = split[1];
    part2 = split[2];
    part3 = split[3];

    switch (cmd) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "help":
        case "menu":
            showMenu();
            break;
        case "log":
            await log(part1);
            break;
        case "shelf":
            await shelf();
            break;
        case "inventory":
            await inventory(part1);
            break;
        case "invadd":
            await invadd(part1, part2, part3);
            break;
        case "invdel":
            await invdel(part1, part2, part3);
            break;
        default:
            showMenu();
    }
    rl.prompt();
}

/**
 * Show the menu on that can be done.
 *
 * @returns {void}
 */
function showMenu() {
    console.info(
        `\n`
        + `  You can choose from the following commands.\n\n`
        + `  exit, quit, ctrl-d                   - to exit the program.\n`
        + `  help, menu                           - to show this menu.\n`
        + `  log <number>                         - show recent log inserts.\n`
        + `  shelf                                - show warehouse shelves.\n`
        + `  inventory                            - show product inventory.\n`
        + `  inventory <str>                      - filter product inventory.\n`
        + `  invadd <productid> <shelf> <number>  - add stock.\n`
        + `  invdel <productid> <shelf> <number>  - remove stock.\n`
    );
}

/**
 * show log
 *
 * @async
 * @returns {void}
 */
async function log(num) {
    console.info(`Showing the last ${num} log inserts\n\n`);
    let res;
    let str;

    res = await eshop.showLog(num);
    str = cTable.getTable(res);
    console.log(str);
}


/**
 * show shelves
 *
 * @async
 * @returns {void}
 */
async function shelf() {
    console.info(`Here are all the available shelves\n\n`);
    let res;
    let str;

    res = await eshop.showShelf();
    str = cTable.getTable(res);
    console.info(str);
}

/**
 * show inventory
 *
 * @async
 * @returns {void}
 */
async function inventory(fltr) {
    let res;
    let str;

    if (fltr) {
        res = await eshop.filterInventory(fltr);
        console.info(`Here are the inventory details for ${fltr}\n\n`);
    } else {
        res = await eshop.showInventory();
        console.info(`Here are the inventory details\n\n`);
    }

    str = cTable.getTable(res);
    console.info(str);
}

/**
 * add inventory
 *
 * @async
 * @returns {void}
 */
async function invadd(product, shelf, num) {
    console.info(`Added ${num} of ${product} to ${shelf}\n\n`);
    let res;
    let str;

    await eshop.addInv(product, shelf, num);
    res = await eshop.filterInventory(product);
    str = cTable.getTable(res);
    console.info(str);
}

/**
 * remove inventory
 *
 * @async
 * @returns {void}
 */
async function invdel(product, shelf, num) {
    console.info(`Removed ${num} of ${product} from ${shelf}\n\n`);
    let res;
    let str;

    await eshop.delInv(product, shelf, num);
    res = await eshop.filterInventory(product);
    str = cTable.getTable(res);
    console.info(str);
}

/**
 * quit program
 *
 * @param {number} code Exit with this value, defaults to 0.
 *
 * @returns {void}
 */
function exitProgram(code) {
    code = code || 0;

    console.info("Exiting with status code " + code);
    process.exit(code);
}
