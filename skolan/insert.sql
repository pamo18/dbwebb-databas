--
-- Skapa fler tabeller
-- By Paul Moreland for course "databas".
-- 2019-02-07
--

--
--  Empty the table first
--
DELETE FROM larare;
DELETE FROM larare_pre;

--
-- Add teacher staff
--
INSERT INTO larare
    (akronym, avdelning, fornamn, efternamn, kon, lon, fodd)
VALUES
    ('sna', 'DIPT', 'Severus', 'Snape', 'M', 40000, '1951-05-01'),
    ('dum', 'ADM', 'Albus', 'Dumbledore', 'M', 80000, '1941-04-01'),
    ('min', 'DIDD', 'Minerva', 'McGonagall', 'K', 40000, '1955-05-05'),
    ('hag', 'ADM', 'Hagrid', 'Rubeus', 'M', 25000, '1956-05-06'),
    ('fil', 'ADM', 'Argus', 'Filch', 'M', 25000, '1946-04-06'),
    ('hoc', 'DIDD', 'Madam', 'Hooch', 'K', 35000, '1948-04-08')
;

INSERT INTO larare
    (akronym, avdelning, fornamn, efternamn, kon, fodd)
VALUES
    ('gyl', 'DIPT', 'Gyllenroy', 'Lockman', 'M', '1952-05-02'),
    ('ala', 'DIPT', 'Alastor', 'Moody', 'M', '1943-04-03')
;

--
-- Update a column value using where or
--
UPDATE larare
    SET
        lon = 30000
    WHERE
        akronym = 'gyl'
        OR akronym = 'ala'
;

--
-- Copy larare data into larare_pre
--
INSERT INTO larare_pre SELECT * FROM larare;
