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
const bank = require("./src/bank.js");
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
        "\nWelcome to PAMOBank!\n"
        + "Access to the bank accounts has been granted!\n"
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
    let fromAcc;
    let toAcc;
    let amount;

    line = line.trim();
    split = line.split(" ");
    cmd = split[0];
    amount = Number.parseFloat(split[1]);
    fromAcc = split[2];
    toAcc = split[3];

    switch (cmd) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "help":
        case "menu":
            showMenu();
            break;
        case "move":
            await moveMoney(1.5, "Adam", "Eva");
            break;
        case "move2":
            await moveMoney(amount, fromAcc, toAcc);
            break;
        case "balance":
            await balance();
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
        + `  exit, quit, ctrl-d - to exit the program.\n`
        + `  help, menu         - to show this menu.\n`
        + `  move               - move 1.5 peng from Adam to Eva.\n`
        + `  move2              - amount from(namn) to(namn).\n`
        + `  balance            - show balance.\n`
    );
}

/**
 * move 1.5 peng to Adam
 *
 * @async
 * @returns {void}
 */
async function moveMoney(a, nameFrom, nameTo) {
    let accountFrom;
    let accountTo;
    let adam = 1111;
    let eva = 2222;

    if (nameFrom.toLowerCase() == "adam") {
        accountFrom = adam;
        accountTo = eva;
    } else if (nameFrom.toLowerCase() == "eva") {
        accountFrom = eva;
        accountTo = adam;
    }
    console.info(`Moving ${a} peng from ${nameFrom} to ${nameTo}\n\n`);
    await bank.moveToAdam(a, accountFrom, accountTo);
}


/**
 * show balance
 *
 * @async
 * @returns {void}
 */
async function balance() {
    console.info(`Here is the current balance\n\n`);
    let res;
    let str;

    res = await bank.showBalance();
    str = cTable.getTable(res);
    console.info(str);
}

/**
 * Close down program and exit with a status code.
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
