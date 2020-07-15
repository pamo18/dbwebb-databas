--
-- Paul Moreland
-- pamo18
-- 2019/03/28
--

-- -----------------------------------------------------------------------------
-- Views
-- -----------------------------------------------------------------------------

--
-- v_logg
--
DROP VIEW IF EXISTS v_logg;

CREATE VIEW v_logg
AS
SELECT
logg.id AS logg_id,
logg.kategori_typ AS kategori_typ,
organisation.id AS org_id,
organisation.namn AS org_namn,
person.id AS person_id,
CONCAT(person.fornamn, ' ', person.efternamn) AS person_namn,
kategori.niva AS niva,
logg.vad AS vad

FROM logg

JOIN organisation
ON logg.organisation_id = organisation.id

JOIN person
ON logg.person_id = person.id

JOIN kategori
ON logg.kategori_typ = kategori.typ

ORDER BY logg.id;

--
-- v_person
--
DROP VIEW IF EXISTS v_person;

CREATE VIEW v_person
AS
SELECT
CONCAT(person.fornamn, ' ', person.efternamn, ' (', person.id, ')') AS Namn,
(SELECT COUNT(person_id) FROM logg WHERE person_id = person.id) AS Antal,
GROUP_CONCAT(DISTINCT organisation.namn SEPARATOR ' + ') AS Organisation

FROM person

LEFT OUTER JOIN logg
ON logg.person_id = person.id

LEFT OUTER JOIN organisation
ON logg.organisation_id = organisation.id
GROUP BY person.id
ORDER BY Antal DESC, Namn DESC
;

-- -----------------------------------------------------------------------------
-- Procedures
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- CRUD - Create
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- CRUD - Read
-- -----------------------------------------------------------------------------

--
-- show_all_logg
--
DROP PROCEDURE IF EXISTS show_all_logg;
DELIMITER ;;
CREATE PROCEDURE show_all_logg()
BEGIN
    SELECT
    *
    FROM v_logg;
END
;;
DELIMITER ;

--
-- show_short_logg
--
DROP PROCEDURE IF EXISTS show_short_logg;
DELIMITER ;;
CREATE PROCEDURE show_short_logg()
BEGIN
    SELECT
    logg_id,
    kategori_typ,
    org_id,
    org_namn,
    person_id,
    person_namn,
    niva,
    SUBSTRING(vad, 1, 20) AS kort_vad

    FROM v_logg;
END
;;
DELIMITER ;

--
-- view_log_filter
--
DROP PROCEDURE IF EXISTS view_log_filter;
DELIMITER ;;
CREATE PROCEDURE view_log_filter(
	_filter TEXT)
BEGIN
	SELECT * FROM v_logg
    WHERE kategori_typ
    LIKE CONCAT('%', _filter, '%')
    OR person_id
    LIKE CONCAT('%', _filter, '%')
    OR person_namn
    LIKE CONCAT('%', _filter, '%')
    OR org_id
    LIKE CONCAT('%', _filter, '%')
    OR org_namn
    LIKE CONCAT('%', _filter, '%')
    OR vad
    LIKE CONCAT('%', _filter, '%')
    OR niva = _filter;
END
;;
DELIMITER ;

--
-- view_short_filter
--
DROP PROCEDURE IF EXISTS view_short_filter;
DELIMITER ;;
CREATE PROCEDURE view_short_filter(
	_filter TEXT)
BEGIN
	SELECT
    logg_id,
    kategori_typ,
    org_id,
    org_namn,
    person_id,
    person_namn,
    niva,
    SUBSTRING(vad, 1, 20) AS kort_vad
    FROM v_logg
    WHERE kategori_typ
    LIKE CONCAT('%', _filter, '%')
    OR person_id
    LIKE CONCAT('%', _filter, '%')
    OR person_namn
    LIKE CONCAT('%', _filter, '%')
    OR org_id
    LIKE CONCAT('%', _filter, '%')
    OR org_namn
    LIKE CONCAT('%', _filter, '%')
    OR vad
    LIKE CONCAT('%', _filter, '%')
    OR niva = _filter;
END
;;
DELIMITER ;

--
-- view_person
--
DROP PROCEDURE IF EXISTS view_person;
DELIMITER ;;
CREATE PROCEDURE view_person()
BEGIN
    SELECT
    *
    FROM v_person;
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- CRUD - Update
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- CRUD - Delete
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Other procedures
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- Triggers
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
--
-- Functions
-- -----------------------------------------------------------------------------
