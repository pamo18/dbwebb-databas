--
-- Vyer
-- By Paul Moreland for course "databas".
-- 2019-02-01
--

DROP VIEW IF EXISTS v_larare;

CREATE VIEW v_larare
AS
SELECT *, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Age
FROM larare;

-- Use DROP VIEW to delete view, DROP VIEW v_larare;

-- Använd vyn
SELECT avdelning, ROUND(AVG(Age)) AS 'Snittålder'
FROM v_larare
GROUP BY avdelning
ORDER BY ROUND(AVG(Age)) DESC;
