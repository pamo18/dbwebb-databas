--
-- Update a column value
--
-- UPDATE larare SET lon = 30000 WHERE akronym = 'gyl';

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
-- Update a column value using where in
--
-- UPDATE larare
--     SET
--         lon = 30000
--     WHERE
--         akronym IN ('gyl', 'ala')
-- ;

--
-- Update a column value using where is
--
-- UPDATE larare
--     SET
--         lon = 30000
--     WHERE
--         lon IS NULL
-- ;

--
-- View columns from larare in decreasing order of lon
--
-- SELECT akronym, avdelning, fornamn, kon, lon, kompetens
-- FROM larare
-- ORDER BY lon DESC;
