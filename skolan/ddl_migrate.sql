-- Add column to table
-- ALTER TABLE larare ADD COLUMN kompetens INT;

--
-- Add column to table with default value and null not allowed
--
ALTER TABLE larare ADD COLUMN kompetens INT NOT NULL DEFAULT 1;


--
-- Check results
--
-- SELECT akronym, fornamn, kompetens FROM larare;

--
-- Show columns
--
-- SHOW COLUMNS FROM larare;

--
-- Sum columns
--
-- SELECT SUM(lon) AS 'Lönesumma', SUM(kompetens) AS Kompetens FROM larare;
