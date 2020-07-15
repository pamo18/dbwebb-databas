/**
 * Paul Moreland
 * pamo18
 * 2019/03/28
 */

"use strict";
// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Import the exam module
const exam = require("./src/sapo.js");
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
        "\nWelcome to Sapo!\n"
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
    //let part2;
    //let part3;

    line = line.trim();
    split = line.split(" ");
    cmd = split[0];
    part1 = split[1];
    //part2 = split[2];
    //part3 = split[3];

    switch (cmd) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "help":
        case "menu":
            showMenu();
            break;
        case "logg":
            await viewLogg();
            break;
        case "search":
            await searchTheLogs(part1);
            break;
        case "person":
            await viewPerson();
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
        + `  exit, quit, ctrl-d          - to exit the program.\n`
        + `  help, menu                  - to show this menu.\n`
        + `  logg                        - show all the logg.\n`
        + `  search <str>                - search the logg.\n`
        + `  person                      - View special person report.\n`
    );
}

/**
 * View logg
 *
 * @async
 * @returns {void}
 */
async function viewLogg() {
    console.info(`Table view\n\n`);
    let res;
    let str;

    res = await exam.viewShortLogg();
    console.info(`Here are all the logs\n\n`);
    str = cTable.getTable(res);
    console.log(str);
}

/**
 * Search logs
 *
 * @async
 * @returns {void}
 */
async function searchTheLogs(fltr) {
    let res;
    let str;

    if (fltr) {
        res = await exam.viewShortFiltered(fltr);
        console.info(`Here are the filtered logs for ${fltr}\n\n`);
    } else {
        res = await exam.viewShortLogg();
        console.info(`Here are all the logs\n\n`);
    }

    str = cTable.getTable(res);
    console.info(str);
}

/**
 * View person
 *
 * @async
 * @returns {void}
 */
async function viewPerson() {
    console.info(`Person view\n\n`);
    let res;
    let str;

    res = await exam.viewPerson();
    console.info(`Here are all the results\n\n`);
    str = cTable.getTable(res);
    console.log(str);
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
