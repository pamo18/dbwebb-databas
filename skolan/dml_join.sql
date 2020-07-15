--
-- Joina tabell
-- By Paul Moreland for course "databas".
-- 2019-02-01
--

--
-- JOIN
--
DROP VIEW IF EXISTS v_lonerevision;

CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym AS akronym,
    l.avdelning AS avdelning,
    l.fornamn AS fornamn,
    l.efternamn AS efternamn,
    p.lon AS pre,
    l.lon AS nu,
    l.lon - p.lon AS diff,
    ROUND((((l.lon - p.lon) / p.lon) * 100), 2) AS proc,
    IF(ROUND((((l.lon - p.lon) / p.lon) * 100), 2) < 3, "nok", "ok") AS mini,
    p.kompetens AS prekomp,
    l.kompetens AS nukomp,
    (l.kompetens - p.kompetens) AS diffkomp
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym;

SELECT
akronym, fornamn, efternamn, pre, nu, diff, proc, mini
FROM v_lonerevision
ORDER BY proc DESC, mini DESC;

SELECT
akronym, fornamn, efternamn, prekomp, nukomp, diffkomp
FROM v_lonerevision
ORDER BY nukomp DESC, diffkomp DESC, nu DESC;
