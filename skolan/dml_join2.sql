--
-- Join 2
-- By Paul Moreland for course "databas".
-- 2019-02-07
--
DROP VIEW IF EXISTS v_planering;

--
-- A crossjoin
--
-- SELECT * FROM kurs, kurstillfalle;


--
-- Join using WHERE, use alias AS to shorten the statement
--
-- SELECT *
-- FROM kurs AS k, kurstillfalle AS kt
-- WHERE k.kod = kt.kurskod;


--
-- Join using JOIN..ON
--
-- SELECT *
-- FROM kurs AS k
--     JOIN kurstillfalle AS kt
--         ON k.kod = kt.kurskod;


--
-- Join three tables view
--
CREATE VIEW v_planering
AS
SELECT *
FROM kurs AS k
    JOIN kurstillfalle AS kt
        ON k.kod = kt.kurskod
    JOIN larare AS l
        ON l.akronym = kt.kursansvarig;

--
-- Lärares arbetsbelastning
--
SELECT
    akronym AS Akronym,
    CONCAT(fornamn, ' ', efternamn) AS Namn,
    COUNT(Akronym) AS Tillfallen
FROM v_planering
GROUP BY akronym
ORDER BY Tillfallen DESC, Akronym;

--
-- Kursansvariges ålder
--
SELECT
    CONCAT(namn, ' (', kurskod, ')') AS 'Kursnamn',
    CONCAT(fornamn, ' ', efternamn, ' (', akronym, ')') AS 'Larare',
    TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS 'Ålder'
FROM v_planering
ORDER BY TIMESTAMPDIFF(YEAR, fodd, CURDATE()) DESC
LIMIT 6;
