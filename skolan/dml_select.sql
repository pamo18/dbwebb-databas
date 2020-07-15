--
-- Report
--

--
-- where
--

-- Visa alla rader i tabellen där avdelningen är DIDD.
SELECT * FROM larare WHERE avdelning = 'DIDD';

-- Visa de rader som har en akronym som börjar med bokstaven ‘h’ (ledtråd LIKE).
SELECT * FROM larare WHERE akronym LIKE 'h%';

-- Visa de rader vars lärares förnamn innehåller bokstaven ‘o’.
SELECT * FROM larare WHERE fornamn LIKE '%o%';

-- Visa de rader där lärarna tjänar mellan 30 000 - 50 000.
SELECT * FROM larare WHERE lon >= 30000 AND lon <= 50000;

-- Visa de rader där lärarens kompetens är mindre än 7 och lönen är större
-- än 40 000.
SELECT * FROM larare WHERE kompetens < 7 AND lon > 40000;

-- Visa rader som innehåller lärarna sna, dum, min (ledtråd IN).
SELECT * FROM larare WHERE akronym IN ('sna', 'dum', 'min');

-- Visa de lärare som har lön över 80 000, tillsammans med de lärare som har en
-- kompetens om 2 och jobbar på avdelningen ADM.
SELECT * FROM larare WHERE (lon > 80000) OR (kompetens = 2 AND avdelning = 'ADM');

--
-- order by
--

-- Skriv endast ut namnen på alla lärare och vad de tjänar.
SELECT fornamn, lon FROM larare;

-- Sortera listan på efternamnet, både i stigande ordning.
SELECT fornamn, lon FROM larare ORDER BY efternamn ASC;

-- Sortera listan på efternamnet, både i sjunkande ordning.
SELECT fornamn, lon FROM larare ORDER BY efternamn DESC;

-- Sortera listan på lönen, både i stigande ordning.
-- Vem tjänar mest och vem tjänar minst?
SELECT fornamn, lon FROM larare ORDER BY lon ASC;

-- Sortera listan på lönen, både i sjunkande ordning.
-- Vem tjänar mest och vem tjänar minst?
SELECT fornamn, lon FROM larare ORDER BY lon DESC;

-- Välj ut de tre som tjänar mest och visa dem (ledtråd LIMIT).
SELECT fornamn, lon FROM larare ORDER BY lon DESC LIMIT 3;

--
-- Change namn of a column
--
SELECT
    fornamn AS 'Lärare',
    lon AS 'Lön',
    avdelning AS "Avdelning"
FROM larare;
