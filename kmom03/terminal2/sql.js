/**
 * A module for the Hogwarts School Database, SQL.
 */
"use strict";

class Sql {
    /**
     * @constructor
     */
    constructor() {
        this.name = "Hogwarts teacher database SQL code";
    }

    /**
     * Show all the teachers at Hogwarts.
     */
    showTeacher() {
        let sql;

        sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                avdelning,
                lon,
                kompetens,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS 'fodd',
                Age As 'Ålder'
            FROM v_larare
            ORDER BY Age DESC;
        `;
        return sql;
    }

    /**
     * Compare the teachers competence since last revision.
     */
    showKompetens() {
        let sql;

        sql = `
            SELECT
            akronym, fornamn, efternamn, prekomp, nukomp, diffkomp
            FROM v_lonerevision
            ORDER BY nukomp DESC, diffkomp DESC, nu DESC;
        `;

        return sql;
    }

    /**
     * Compare the teachers wages since the last revision.
     */
    showLon() {
        let sql;

        sql = `
            SELECT
            akronym, fornamn, efternamn, pre, nu, diff, proc, mini
            FROM v_lonerevision
            ORDER BY proc DESC, mini DESC;
        `;

        return sql;
    }

    /**
     * Search all teacher data at Hogwarts.
     */
    searchAll() {
        let sql;

        sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                avdelning,
                lon,
                kompetens,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS 'fodd',
                Age As 'Ålder'
            FROM v_larare
            WHERE
                akronym LIKE ?
                OR fornamn LIKE ?
                OR efternamn LIKE ?
                OR avdelning LIKE ?
                OR lon = ?
                OR kompetens = ?
                OR Age = ?
            ORDER BY akronym;
        `;

        return sql;
    }

    /**
     * Update wage.
     */
    updateWage() {
        let sql;

        sql = `
            UPDATE larare
            SET
                lon = ?
            WHERE
                akronym = ?;
        `;

        return sql;
    }

    /**
     * Show a teachers updated wage.
     */
    showUpdatedWage() {
        let sql;

        sql = `
            SELECT
                akronym,
                fornamn,
                efternamn,
                avdelning,
                lon,
                kompetens,
                DATE_FORMAT(fodd, '%Y-%m-%d') AS 'fodd',
                TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS 'Ålder',
                Age AS 'Ålder'
            FROM v_larare
            WHERE
                akronym = ?;
        `;

        return sql;
    }
}

module.exports = Sql;
