--
-- Skapa fler tabeller
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

SET NAMES 'utf8';

--
-- Update table larare and larare_pre to use same charset
-- and collation.
--
ALTER TABLE larare CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
ALTER TABLE larare_pre CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;

--
-- Ange vilket sätt som tabeller skall lagras på
--
-- CREATE TABLE t1 (i INT) ENGINE MYISAM;
-- CREATE TABLE t2 (i INT) ENGINE INNODB;

-- Drop tables in order to avoid FK constraint
DROP TABLE IF EXISTS kurstillfalle;
DROP TABLE IF EXISTS kurs;

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
