--
-- Outer Join
-- By Paul Moreland for course "databas".
-- 2019-02-07

--
-- Outer join, inkludera lärare utan undervisning
--
-- SELECT DISTINCT
--     l.akronym AS Akronym,
--     CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
--     l.avdelning AS Avdelning,
--     kt.kurskod AS Kurskod
-- FROM larare AS l
--     LEFT OUTER JOIN kurstillfalle AS kt
--         ON l.akronym = kt.kursansvarig
-- ;

--
-- Outer join, inkludera lärare utan undervisning
--
-- SELECT DISTINCT
--     l.akronym AS Akronym,
--     CONCAT(l.fornamn, " ", l.efternamn) AS Namn,
--     l.avdelning AS Avdelning,
--     kt.kurskod AS Kurskod
-- FROM larare AS l
--     RIGHT OUTER JOIN kurstillfalle AS kt
--         ON l.akronym = kt.kursansvarig
-- ;

--
-- Outer join, inkludera lärare utan undervisning where NULL
--
SELECT DISTINCT
    k.kod AS 'Kurskod',
    k.namn AS 'Kursnamn',
    kt.lasperiod AS 'Läsperiod'
FROM kurs AS k
    LEFT OUTER JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
WHERE kt.lasperiod IS NULL
ORDER BY k.namn
;
