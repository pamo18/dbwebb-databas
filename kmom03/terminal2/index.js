/**
 * Guess my number, a sample CLI client.
 */
"use strict";
// Read from commandline
const readline = require("readline");
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Import the School module
const School = require("./school.js");
const school = new School();



/**
 * Main function.
 *
 * @returns void
 */
(function() {
    rl.on("close", exitProgram);
    rl.on("line", handleInput);

    console.log(
        "\nWelcome to Hogwarts!\n"
        + "Access to the school database has been granted!\n"
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
    let search;
    let cmd;
    let wage;

    line = line.trim();
    split = line.split(" ");
    cmd = split[0];
    search = split[1];
    wage = Number.parseInt(split[2]);

    switch (cmd) {
        case "quit":
        case "exit":
            process.exit();
            break;
        case "help":
        case "menu":
            showMenu();
            break;
        case "larare":
            await makeTeachers();
            break;
        case "kompetens":
            await makeKompetens();
            break;
        case "lon":
            await makeLon();
            break;
        case "sok":
            await makeSearch(search);
            break;
        case "nylon":
            await makeUpdate(search, wage);
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
        + `  help, menu - to show this menu.\n`
        + `  larare     - show all the teachers at Hogwarts.\n`
        + `  kompetens  - Compare the teachers competence since the last revision.\n`
        + `  lon        - Compare the teachers wages since the last revision.\n`
        + `  sok        - search for a teacher.\n`
        + `  nylon      - update a teachers wage.\n`
    );
}



/**
 * Show all the teachers at Hogwarts.
 *
 * @async
 * @returns {void}
 */
async function makeTeachers() {
    console.info(`Here are the results...\n\n`);
    await school.teacher();
}

/**
 * Compare the teachers competence since last revision.
 *
 * @async
 * @returns {void}
 */
async function makeKompetens() {
    console.info(`Here are the results...\n\n`);
    await school.kompetens();
}

/**
 * Compare the teachers wages since the last revision.
 *
 * @async
 * @returns {void}
 */
async function makeLon() {
    console.info(`Here are the results...\n\n`);
    await school.lon();
}

/**
 * Search for teachers at Hogwarts.
 *
 * @async
 * @returns {void}
 */
async function makeSearch(search) {
    console.info(`Searching for: ${search}\n\n`);
    await school.search(search);
}

/**
 * Search for teachers by acronym and updates the wage.
 *
 * @async
 * @returns {void}
 */
async function makeUpdate(search, wage) {
    console.info(`Searching for: ${search} and updating lon to ${wage}\n\n`);
    await school.update(search, wage);
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
