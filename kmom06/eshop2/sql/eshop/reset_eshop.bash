#!/usr/bin/env bash
# shellcheck disable=SC2181

#
# Load a SQL file into eshop
#
function loadSqlIntoEshop
{
    echo ">>> $4 ($3)"
    mysql "-u$1" "-p$2" eshop < "$3" > /dev/null
    if [ $? -ne 0 ]; then
        echo "The command failed, you may have issues with your SQL code."
        echo "Verify that all SQL commands can be exeucted in sequence in the file:"
        echo " '$3'"
        exit 1
    fi
}

#
# Recreate and reset the database to be as after part II.
#
echo ">>> Reset eshop"
loadSqlIntoEshop "root" "" "setup.sql" "Initiera database och anvandare"
loadSqlIntoEshop "user" "pass" "ddl.sql" "Create tables and views"
loadSqlIntoEshop "user" "pass" "insert.sql" "Insert into eshop"
