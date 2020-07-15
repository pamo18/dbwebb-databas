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
const exam = require("./src/exam.js");
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
        "\nWelcome to Exam Try 1!\n"
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
    //let part3;

    line = line.trim();
    split = line.split(" ");
    cmd = split[0];
    part1 = split[1];
    part2 = split[2];
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
        case "sushi":
            await viewSushi();
            break;
        case "tavling":
            await viewComp(part1);
            break;
        case "rosta":
            await voteSushi(part1, part2);
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
        + `  sushi                                - show all the sushi.\n`
        + `  tavling <id>                         - show all the competitions.\n`
        + `  rosta <tavlingsid> <sushiid>         - Vote for a sushi.\n`
    );
}

/**
 * View sushi
 *
 * @async
 * @returns {void}
 */
async function viewSushi() {
    console.info(`Table view\n\n`);
    let res;
    let str;

    res = await exam.viewAllSushi();
    str = cTable.getTable(res);
    console.log(str);
}

/**
 * View competitions
 *
 * @async
 * @returns {void}
 */
async function viewComp(id) {
    console.info(`Table view\n\n`);
    let res;
    let str;

    if (id) {
        res = await exam.viewCompSushi(id);
    } else {
        res = await exam.viewAllComp();
    }

    str = cTable.getTable(res);
    console.log(str);
}

/**
 * Vote sushi
 *
 * @async
 * @returns {void}
 */
async function voteSushi(compID, sushiID) {
    let res;
    let str;

    await exam.voteCompSushi(compID, sushiID);
    res = await exam.viewCompSushi(compID);
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
