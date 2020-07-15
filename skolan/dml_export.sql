--
-- Exportera rapport till Excel
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

--
-- Export SQL call from terminal to Excel
-- mysql -uuser -ppass skolan -e "SELECT * FROM larare LIMIT 3;" --batch
--

--
-- Export to from file to Excel
-- mysql -uuser -ppass skolan --batch < dml_export.sql > report.xls
--


SELECT *
FROM larare
LIMIT 3;
