#!/usr/bin/env bash
#
# Recreate and reset the database to be as after part I.
#
echo ">>> Reset skolan to after part 1"
echo ">>> Recreate the database (as root)"
mysql -uroot -p skolan < setup.sql > /dev/null

file="ddl.sql"
echo ">>> Create tables ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_insert.sql"
echo ">>> Insert into larare ($file)"
mysql -uuser skolan < $file > /dev/null

file="ddl_migrate.sql"
echo ">>> Alter table larare ($file)"
mysql -uuser skolan < $file > /dev/null

file="dml_update.sql"
echo ">>> Prepare lon revision, base lon larare ($file)"
mysql -uuser skolan < $file > /dev/null

echo ">>> Check lon ammount = 305000, Kompetens = 8."
mysql -uuser skolan -e "SELECT SUM(lon) AS 'Lonesumma', SUM(kompetens) AS Kompetens FROM larare;"
