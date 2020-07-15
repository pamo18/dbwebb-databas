--
-- Skapa fler tabeller
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

SET NAMES 'utf8';

-- Drop tables in order to avoid FK constraint
DROP VIEW IF EXISTS v_lonerevision;
DROP VIEW IF EXISTS v_larare;
DROP TABLE IF EXISTS larare_pre;
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;
DROP TABLE IF EXISTS larare;

--
-- Create table: larare
--
CREATE TABLE larare
(
    akronym CHAR(3),
    avdelning CHAR(4),
    fornamn VARCHAR(20),
    efternamn VARCHAR(20),
    kon CHAR(1),
    lon INT,
    fodd DATE,
    kompetens INT NOT NULL DEFAULT 1,

    PRIMARY KEY (akronym)
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

--
-- Create table: kurs
--
CREATE TABLE kurs
(
    kod CHAR(6) NOT NULL,
    namn VARCHAR(40),
    poang FLOAT,
    niva CHAR(3),

    PRIMARY KEY (kod)
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

--
-- Create table: kurstillfalle
--
CREATE TABLE kurstillfalle
(
    id INT AUTO_INCREMENT NOT NULL,
    kurskod CHAR(6) NOT NULL,
    kursansvarig CHAR(3) NOT NULL,
    lasperiod INT NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (kurskod) REFERENCES kurs(kod),
    FOREIGN KEY (kursansvarig) REFERENCES larare(akronym)
)
ENGINE INNODB
CHARSET utf8
COLLATE utf8_swedish_ci
;

--
-- Make copy of table
--
CREATE TABLE larare_pre LIKE larare;

--
-- View larare
--
CREATE VIEW v_larare
AS
SELECT *, TIMESTAMPDIFF(YEAR, fodd, CURDATE()) AS Age
FROM larare;

--
-- View lon revision
--
CREATE VIEW v_lonerevision
AS
SELECT
    l.akronym AS akronym,
    l.avdelning AS avdelning,
    l.fornamn AS fornamn,
    l.efternamn AS efternamn,
    p.lon AS pre,
    l.lon AS nu,
    l.lon - p.lon AS diff,
    ROUND((((l.lon - p.lon) / p.lon) * 100), 2) AS proc,
    IF(ROUND((((l.lon - p.lon) / p.lon) * 100), 2) < 3, "nok", "ok") AS mini,
    p.kompetens AS prekomp,
    l.kompetens AS nukomp,
    (l.kompetens - p.kompetens) AS diffkomp
FROM larare AS l
    JOIN larare_pre AS p
        ON l.akronym = p.akronym;
