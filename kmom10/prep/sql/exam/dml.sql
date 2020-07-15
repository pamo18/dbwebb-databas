--
-- Paul Moreland
-- pamo18
-- 2019/03/28
--

-- -----------------------------------------------------------------------------
-- Views
-- -----------------------------------------------------------------------------

--
-- v_competition
--
DROP VIEW IF EXISTS v_competition;

CREATE VIEW v_competition
AS
SELECT
competition.id,
competition.name,
competition.details,
DATE_FORMAT(competition.comp_date, '%Y-%m-%d') AS competiton_date,
sushi.id AS sushi_id,
sushi.name AS sushi_name,
sushi.details AS sushi_details,
sushi.image AS sushi_image,
sushi2competition.vote AS votes

FROM competition

LEFT JOIN sushi2competition
ON competition.id = sushi2competition.competition_id

LEFT JOIN sushi
ON sushi.id = sushi2competition.sushi_id

ORDER BY sushi2competition.vote DESC, sushi.id;

-- -----------------------------------------------------------------------------
-- Procedures
-- -----------------------------------------------------------------------------

-- -----------------------------------------------------------------------------
-- CRUD - Create
-- -----------------------------------------------------------------------------

--
-- create_sushi
--
DROP PROCEDURE IF EXISTS create_sushi;
DELIMITER ;;
CREATE PROCEDURE create_sushi(
    a_name VARCHAR(45),
    a_details TEXT,
    a_sushi_date TIMESTAMP,
    a_image VARCHAR(45)
)
BEGIN
    INSERT INTO sushi (name, details, sushi_date, image) VALUES (
        a_name,
        a_details,
        a_sushi_date,
        a_image
    );
END
;;
DELIMITER ;

--
-- create_comp
--
DROP PROCEDURE IF EXISTS create_comp;
DELIMITER ;;
CREATE PROCEDURE create_comp(
    a_name VARCHAR(45),
    a_details TEXT,
    a_comp_date TIMESTAMP
)
BEGIN
    INSERT INTO competition (name, details, comp_date) VALUES (
        a_name,
        a_details,
        a_comp_date
    );
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- CRUD - Read
-- -----------------------------------------------------------------------------

--
-- show_all_sushi
--
DROP PROCEDURE IF EXISTS show_all_sushi;
DELIMITER ;;
CREATE PROCEDURE show_all_sushi()
BEGIN
    SELECT
    id,
    name,
    details,
    DATE_FORMAT(sushi_date, '%Y-%m-%d') AS tv_date,
    image
    FROM sushi;
END
;;
DELIMITER ;

--
-- show_sushi
--
DROP PROCEDURE IF EXISTS show_sushi;
DELIMITER ;;
CREATE PROCEDURE show_sushi(
    _id INT
)
BEGIN
    SELECT
    id,
    name,
    details,
    DATE_FORMAT(sushi_date, '%Y-%m-%d') AS tv_date,
    image
    FROM sushi
    WHERE
    id = _id;
END
;;
DELIMITER ;

--
-- show_all_comp
--
DROP PROCEDURE IF EXISTS show_all_comp;
DELIMITER ;;
CREATE PROCEDURE show_all_comp()
BEGIN
    SELECT
    id,
    name,
    details,
    DATE_FORMAT(comp_date, '%Y-%m-%d') AS competiton_date
    FROM competition;
END
;;
DELIMITER ;

--
-- show_comp
--
DROP PROCEDURE IF EXISTS show_comp;
DELIMITER ;;
CREATE PROCEDURE show_comp(
    _id INT
)
BEGIN
    SELECT
    id,
    name,
    details,
    DATE_FORMAT(comp_date, '%Y-%m-%d') AS competiton_date
    FROM competition
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- show_comp_details
--
DROP PROCEDURE IF EXISTS show_comp_details;
DELIMITER ;;
CREATE PROCEDURE show_comp_details(_id INT)
BEGIN
    SELECT * FROM v_competition WHERE id = _id;
END
;;
DELIMITER ;

--
-- show_comp_sushi
--
DROP PROCEDURE IF EXISTS show_comp_sushi;
DELIMITER ;;
CREATE PROCEDURE show_comp_sushi(_id INT)
BEGIN
    SELECT
    sushi_id,
    sushi_name,
    sushi_details,
    sushi_image,
    votes

    FROM v_competition
    WHERE id = _id;
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- CRUD - Update
-- -----------------------------------------------------------------------------

--
-- update_sushi
--
DROP PROCEDURE IF EXISTS update_sushi;
DELIMITER ;;
CREATE PROCEDURE update_sushi(
    a_id INT,
    a_name VARCHAR(45),
    a_details TEXT,
    a_sushi_date TIMESTAMP,
    a_image VARCHAR(45)
)
BEGIN
    UPDATE sushi
    SET
        name = a_name,
        details = a_details,
        sushi_date = a_sushi_date,
        image = a_image
    WHERE
        id = a_id;
END
;;
DELIMITER ;

--
-- update_comp
--
DROP PROCEDURE IF EXISTS update_comp;
DELIMITER ;;
CREATE PROCEDURE update_comp(
    a_id INT,
    a_name VARCHAR(45),
    a_details TEXT,
    a_comp_date TIMESTAMP
)
BEGIN
    UPDATE competition
    SET
        name = a_name,
        details = a_details,
        comp_date = a_comp_date
    WHERE
        id = a_id;
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- CRUD - Delete
-- -----------------------------------------------------------------------------

--
-- delete_sushi
--
DROP PROCEDURE IF EXISTS delete_sushi;
DELIMITER ;;
CREATE PROCEDURE delete_sushi(a_id INT)
BEGIN
    DELETE FROM sushi2competition WHERE sushi_id = a_id;
    DELETE FROM sushi WHERE id = a_id;
END
;;
DELIMITER ;

--
-- delete_comp
--
DROP PROCEDURE IF EXISTS delete_comp;
DELIMITER ;;
CREATE PROCEDURE delete_comp(a_id INT)
BEGIN
    DELETE FROM sushi2competition WHERE competition_id = a_id;
    DELETE FROM competition WHERE id = a_id;
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Other procedures
-- -----------------------------------------------------------------------------

--
-- vote_comp_sushi
--
DROP PROCEDURE IF EXISTS vote_comp_sushi;
DELIMITER ;;
CREATE PROCEDURE vote_comp_sushi(_competition_id INT, _sushi_id INT)
BEGIN
    UPDATE sushi2competition
    SET vote = vote + 1
    WHERE
    competition_id = _competition_id
    AND
    sushi_id = _sushi_id;
END
;;
DELIMITER ;

--
-- add_options
--
DROP PROCEDURE IF EXISTS add_options;
DELIMITER ;;
CREATE PROCEDURE add_options(
    _competition_id INT,
	_sushi_id INT
)
BEGIN
	INSERT INTO sushi2competition (competition_id, sushi_id)
    VALUES (_competition_id, _sushi_id);
END
;;
DELIMITER ;

--
-- remove_options
--
DROP PROCEDURE IF EXISTS remove_options;
DELIMITER ;;
CREATE PROCEDURE remove_options(
	_competition_id INT,
    _sushi_id INT
)
BEGIN
    DELETE FROM sushi2competition
    WHERE
    competition_id = _competition_id
    and
    sushi_id = _sushi_id
    ;
END
;;
DELIMITER ;

-- -----------------------------------------------------------------------------
-- Triggers
-- -----------------------------------------------------------------------------

--
-- Trigger 1
--


--
-- Trigger 2
--


-- -----------------------------------------------------------------------------
--
-- Functions
-- -----------------------------------------------------------------------------

--
-- Function 1
--
