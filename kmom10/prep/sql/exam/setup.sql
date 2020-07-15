--
-- Paul Moreland
-- pamo18
-- 2019/03/28
--

-- Radera en databas med allt innehåll
DROP DATABASE IF EXISTS exam;


-- Skapa databas
-- CREATE DATABASE exam;
CREATE DATABASE exam DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci;

-- Välj vilken databas du vill använda
USE exam;

-- -- Radera en databas med allt innehåll
-- DROP DATABASE skolan;
--
-- -- Visa vilka databaser som finns
-- SHOW DATABASES;

-- Visa vilka databaser som finns
-- som heter något i stil med *skolan*
-- SHOW DATABASES LIKE "%exam%";

-- Skapa en användare user med lösenorder pass och ge tillgång oavsett
-- hostnamn.
-- CREATE USER IF NOT EXISTS 'user'@'%'
--     IDENTIFIED BY 'pass'
-- ;

-- -- Skapa användaren med en bakåtkompatibel lösenordsalgoritm.
CREATE USER IF NOT EXISTS 'user'@'%'
    IDENTIFIED WITH mysql_native_password
    BY 'pass'
;

-- -- Ta bort en användare
-- DROP USER 'user'@'%';
-- DROP USER IF EXISTS 'user'@'%';

-- Ge användaren alla rättigheter på en specifk databas.
GRANT ALL ON *.* TO 'user'@'%';

GRANT ALL PRIVILEGES
    ON exam.*
    TO 'user'@'%'
;

-- -- Skapa användaren "user" med
-- -- lösenordet "pass" och ge
-- -- fulla rättigheter till databasen "skolan"
-- -- när användaren loggar in från maskinen "localhost"
-- GRANT ALL ON skolan.* TO user@localhost IDENTIFIED BY 'pass';

-- Visa vad en användare kan göra mot vilken databas.
-- SHOW GRANTS FOR 'user'@'%';

-- -- Visa för nuvarande användare
-- SHOW GRANTS FOR CURRENT_USER;

--
-- Enable LOAD LOCAL INFILE
--
SET GLOBAL local_infile = 1;
