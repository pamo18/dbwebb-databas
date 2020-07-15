--
-- Teckenkodning
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

SET NAMES 'utf8';

DROP TABLE IF EXISTS person;
CREATE TABLE person
(
    fornamn VARCHAR(10)
);

INSERT INTO person VALUES
("Örjan"), ("Börje"), ("Bo"), ("Øjvind"),
("Åke"), ("Åkesson"), ("Arne"), ("Ängla"),
("Ægir")
;

SHOW COLLATION WHERE Charset = 'utf8';

ALTER TABLE person CONVERT TO CHARSET utf8 COLLATE utf8_swedish_ci;
