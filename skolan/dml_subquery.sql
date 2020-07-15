--
-- Subquery, en fråga i fråga
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

-- SELECT
--     *
-- FROM kurstillfalle
-- WHERE
--     kursansvarig IN (
--         SELECT
--             akronym
--         FROM larare
--         WHERE
--             avdelning = 'DIDD'
--     )
-- ;

SELECT
    akronym,
    fornamn,
    efternamn,
    Age
FROM v_larare
WHERE
    Age = (
    SELECT MAX(Age)
    FROM v_larare);
