/**
 * A module for the Hogwarts School Database, functions.
 */
"use strict";
//import Database modules
const mysql  = require("promise-mysql");
const config = require("./config.json");
const cTable = require('console.table');
// Import the Sql module
const Sql = require("./sql.js");
const sql = new Sql();

class School {
    /**
     * @constructor
     */
    constructor() {
        this.name = "Hogwarts teacher database";
    }

    /**
     * Show all the teachers at Hogwarts.
     *
     * @async
     * @returns void
     */
    async teacher() {
        const db = await mysql.createConnection(config);
        let res;
        let str;

        res = await db.query(sql.showTeacher());
        str = cTable.getTable(res);
        console.info(str);
        db.end();
    }

    /**
     * Compare the teachers competence since last revision.
     *
     * @async
     * @returns void
     */
    async kompetens() {
        const db = await mysql.createConnection(config);
        let res;
        let str;

        res = await db.query(sql.showKompetens());
        str = cTable.getTable(res);
        console.info(str);
        db.end();
    }

    /**
     * Compare the teachers wages since the last revision.
     *
     * @async
     * @returns void
     */
    async lon() {
        const db = await mysql.createConnection(config);
        let res;
        let str;

        res = await db.query(sql.showLon());
        str = cTable.getTable(res);
        console.info(str);
        db.end();
    }

    /**
     * Search all teacher data at Hogwarts.
     *
     * @async
     * @returns void
     */
    async search(search) {
        const db = await mysql.createConnection(config);
        let res;
        let str;
        let like = `%${search}%`;

        res = await db.query(sql.searchAll(), [like, like, like, like, search, search, search]);
        str = cTable.getTable(res);
        console.info(str);
        db.end();
    }

    /**
     * Update a teachers wage.
     *
     * @async
     * @returns void
     */
    async update(search, wage) {
        const db = await mysql.createConnection(config);
        let res;
        let str;

        await db.query(sql.updateWage(), [wage, search]);

        res = await db.query(sql.showUpdatedWage(), [search]);
        str = cTable.getTable(res);
        console.info(str);
        db.end();
    }
}

module.exports = School;
