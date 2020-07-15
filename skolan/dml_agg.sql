--
-- Aggregerande funktioner
-- By Paul Moreland for course "databas".
-- 2019-02-01
--

--
-- Hur mycket är den högsta lönen som en lärare har?
--
SELECT MAX(lon) FROM larare;

--
-- Hur mycket är den lägsta lönen som en lärare har?
--
SELECT MIN(lon) FROM larare;

--
-- Hur många lärare jobbar på de respektive avdelning?
--
SELECT
    avdelning,
    COUNT(avdelning)
FROM larare
GROUP BY avdelning
;

--
-- Hur mycket betalar respektive avdelning ut i lön varje månad?
--
SELECT
    avdelning,
    SUM(lon)
FROM larare
GROUP BY avdelning
;

--
-- Hur mycket är medellönen för de olika avdelningarna?
--
SELECT
    avdelning,
    AVG(lon)
FROM larare
GROUP BY avdelning
;

--
-- Hur mycket är medellönen för kvinnor kontra män?
--
SELECT kon, AVG(lon) as Average
FROM larare
GROUP BY kon
ORDER BY Average DESC
;

--
-- Visa snittet på kompetensen för alla avdelningar, sortera på kompetens i
-- sjunkande ordning och visa enbart den avdelning som har högst kompetens.
--
SELECT
    avdelning,
    AVG(kompetens) as Kompetens
FROM larare
GROUP BY avdelning
ORDER BY AVG(kompetens) DESC
LIMIT 1
;

--
-- Visa den avrundade snittlönen (ROUND()) grupperad per avdelning och per
-- kompetens, sortera enligt avdelning och snittlön. Visa även hur många som
-- matchar i respektive gruppering. Ditt svar skall se ut så här.
--
SELECT avdelning, kompetens, ROUND(AVG(lon)), COUNT(avdelning) as Snittlon
FROM larare
GROUP BY avdelning, kompetens
ORDER BY avdelning, ROUND(AVG(lon)) ASC
;

--
-- having 2
--
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(lon) AS Antal
FROM larare
GROUP BY
    avdelning
HAVING
    Snittlon > 35000 AND COUNT(avdelning) >= 3
ORDER BY
    Snittlon DESC
;

--
-- Visa per avdelning hur många anställda det finns gruppens snittlön,
-- sortera per avdelning och snittlön.
SELECT
    avdelning,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(avdelning) AS Antal
FROM larare
GROUP BY
    avdelning
ORDER BY
    avdelning
;

--
-- Visa samma sak som i 1), men visa nu även de kompetenser som finns.
-- Du behöver gruppera på avdelning och per kompetens, sortera per
-- avdelning och per kompetens.
--
SELECT
    avdelning, kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(avdelning) AS Antal
FROM larare
GROUP BY
    avdelning, kompetens
ORDER BY
    avdelning, kompetens DESC
;

--
-- Visa samma sak som i 2), men ignorera de kompetenser som är större än 3.
--
SELECT
    avdelning, kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(avdelning) AS Antal
FROM larare
GROUP BY
    avdelning, kompetens
HAVING kompetens <= 3
ORDER BY
    avdelning, kompetens DESC
;

--
-- Visa samma sak som i 3), men exkludera de grupper som har fler än 1 i
-- Antal och snittlön mellan 30 000 - 45 000. Sortera per snittlön.
--
SELECT
    avdelning, kompetens,
    ROUND(AVG(lon)) AS Snittlon,
    COUNT(avdelning) AS Antal
FROM larare
GROUP BY
    avdelning, kompetens
HAVING Antal <= 1 AND (Snittlon >= 30000 AND Snittlon <= 45000)
ORDER BY
    Snittlon DESC
;
