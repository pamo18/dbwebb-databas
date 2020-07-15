--
-- Inbyggda funktioner
-- By Paul Moreland for course "databas".
-- 2019-02-01
--

--
-- concat
--
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', avdelning, ')') AS NamnAvdelning
FROM larare
;

--
-- concat
--
SELECT
    CONCAT(fornamn, ' ', efternamn, ' (', LCASE(avdelning), ')') AS NamnAvdelning
FROM larare
LIMIT 3
;

--
-- today
--
SELECT CURDATE() AS 'Dagens datum';

--
-- date info
--
SELECT fornamn, fodd, CURDATE() AS 'Dagens datum', CURTIME() AS Klockslag
FROM larare;

--
-- age
--
SELECT fornamn, fodd, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS 'Ålder'
FROM larare
ORDER BY TIMESTAMPDIFF(YEAR, fodd, CURDATE()) DESC;

--
-- 40 tal
--
SELECT fornamn, fodd, YEAR(fodd) AS '40 tal'
FROM larare
WHERE YEAR(fodd) >= 1940 AND YEAR(fodd) <= 1950
ORDER BY YEAR(fodd) ASC;
