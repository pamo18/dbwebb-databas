-- This code removes the user dbwebb, then creates user dbwebb
-- with the same privilages as the user root

DROP USER IF EXISTS 'dbwebb'@'%';

CREATE USER 'dbwebb'@'%'
IDENTIFIED
WITH mysql_native_password -- Only MySQL > 8.0.4
BY 'password'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'dbwebb'@'%'
WITH GRANT OPTION;
;
