--
-- Delete from database skolan.
-- By Paul Moreland for course "databas".
-- 2019-01-23
--

--
-- Delete rows from table
--
DELETE FROM larare WHERE fornamn = 'Hagrid';
DELETE FROM larare WHERE avdelning = 'DIPT';
DELETE FROM larare WHERE lon IS NOT NULL LIMIT 2;
DELETE FROM larare;
