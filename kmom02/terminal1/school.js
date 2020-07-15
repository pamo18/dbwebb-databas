/**
 * Function module
 *
 * @author Paul Moreland
 */
"use strict";

module.exports = {
    "viewTeachers": viewTeachers,
    "searchTeachers": searchTeachers,
    "compareTeachers": compareTeachers
};

/**
 * Output calls to build table with all table details.
 *
 * @async
 * @param {connection} db Database connection.
 *
 * @returns {string} Formatted table to print out.
 */
async function viewTeachers(db) {
    let res;
    let str;
    let sql;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon,
            kompetens,
            fodd
        FROM larare
        ORDER BY akronym;
    `;

    res = await db.query(sql);
    str = teacherAsTable(res);
    return str;
}

/**
 * Output calls to build table with search results.
 *
 * @async
 * @param {connection} db     Database connection.
 * @param {string}     search String to search for.
 *
 * @returns {string} Formatted table to print out.
 */
async function searchTeachers(db, search) {
    let res;
    let str;
    let sql;
    let like = `%${search}%`;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon,
            kompetens,
            fodd
        FROM larare
        WHERE
            akronym LIKE ?
            OR fornamn LIKE ?
            OR efternamn LIKE ?
            OR avdelning LIKE ?
            OR lon = ?
            OR kompetens = ?
        ORDER BY akronym;
    `;

    console.info(`Searching for: ${search}`);

    res = await db.query(sql, [like, like, like, like, search, search]);
    str = teacherAsTable(res);
    return str;
}

/**
 * Output calls to build table with compare results.
 *
 * @async
 * @param {connection} db     Database connection.
 * @param {string}     search String to search for.
 *
 * @returns {string} Formatted table to print out.
 */
async function compareTeachers(db, min, max) {
    let res;
    let str;
    let sql;

    sql = `
        SELECT
            akronym,
            fornamn,
            efternamn,
            avdelning,
            lon,
            kompetens,
            fodd
        FROM larare
        WHERE
            (lon >= ? AND lon <= ?)
            OR (kompetens >= ? AND kompetens <= ?)
        ORDER BY akronym;
    `;

    console.info(`Searching between: ${min} and ${max}`);

    res = await db.query(sql, [min, max, min, max]);
    str = teacherAsTable(res);
    return str;
}

/**
 * Output resultset as formatted table with details on teachers.
 *
 * @param {Array} res Resultset with details on from database query.
 *
 * @returns {string} Formatted table to print out.
 */

function teacherAsTable(res) {
    let str;

    str  = "+-----------+---------------------+------+-------+------+------------+\n";
    str += "| Akronym   | Namn                | Avd  |  Lön  | Komp | Född       |\n";
    str += "|-----------|---------------------|------|-------|------+------------+\n";
    for (const row of res) {
        str += "| ";
        str += row.akronym.padEnd(10);
        str += "| ";
        str += (row.fornamn + " " + row.efternamn).padEnd(20);
        str += "| ";
        str += row.avdelning.padEnd(5);
        str += "| ";
        str += row.lon.toString().padEnd(6);
        str += "| ";
        str += row.kompetens.toString().padStart(2);
        str += "   | ";
        str += row.fodd.toISOString().slice(0, 10).padEnd(10);
        str += " |\n";
    }
    str += "|-----------|---------------------|------|-------|------+------------+\n";

    return str;
}
