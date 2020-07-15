--
-- Views
--

--
-- View products
--
DROP VIEW IF EXISTS v_produkt;

CREATE VIEW v_produkt
AS
SELECT
id,
namn,
pris,
bild_lank,
beskrivning,
GROUP_CONCAT(DISTINCT produkt2kategori.kategori SEPARATOR ', ') AS Kategorier,
GROUP_CONCAT(DISTINCT produkt2lager.hylla_id, '(', antal, ')' SEPARATOR ', ') AS Hylla,
(SELECT sum(antal) FROM produkt2lager WHERE produkt_id_lag = id GROUP BY produkt_id_lag) AS Lagersaldo

FROM produkt

LEFT OUTER JOIN produkt2lager
ON  produkt.id = produkt2lager.produkt_id_lag

LEFT OUTER JOIN produkt2kategori
ON  produkt.id = produkt2kategori.produkt_id_kat

GROUP BY id;

--
-- Customer order view
--

DROP VIEW IF EXISTS v_orders;

CREATE VIEW v_orders
AS
SELECT
orders.id,
DATE_FORMAT(order_created, '%Y-%m-%d -> %H:%i:%s') AS created,
kund_id,
CONCAT(kund.fornamn, ' ', kund.efternamn) AS kund_namn,
(SELECT COUNT(kvantitet) FROM order2produkt WHERE orders.id = order2produkt.order_id) AS order_rows,
order_status,
DATE_FORMAT(order_updated, '%Y-%m-%d -> %H:%i:%s') AS updated,
DATE_FORMAT(order_placed, '%Y-%m-%d -> %H:%i:%s') AS placed,
DATE_FORMAT(order_sent, '%Y-%m-%d -> %H:%i:%s') AS sent,
DATE_FORMAT(order_deleted, '%Y-%m-%d -> %H:%i:%s') AS deleted

FROM orders

LEFT OUTER JOIN order2produkt
ON  order2produkt.order_id = orders.id

JOIN kund
ON orders.kund_id = kund.id

GROUP BY orders.id
ORDER BY orders.id;

--
-- View order details
--
DROP VIEW IF EXISTS v_order_details;

CREATE VIEW v_order_details
AS
SELECT
orders.id,
DATE_FORMAT(order_created, '%Y-%m-%d -> %H:%i:%s') AS created,
kund_id,
CONCAT(kund.fornamn, ' ', kund.efternamn) AS kund_namn,
produkt.namn AS product_name,
kvantitet,
DATE_FORMAT(order_updated, '%Y-%m-%d -> %H:%i:%s') AS updated,
(SELECT COUNT(kvantitet) FROM order2produkt WHERE orders.id = order2produkt.order_id) AS order_rows,
order_status

FROM orders

LEFT OUTER JOIN order2produkt
ON  order2produkt.order_id = orders.id

JOIN kund
ON orders.kund_id = kund.id

LEFT OUTER JOIN produkt
ON order2produkt.produkt_id = produkt.id

ORDER BY orders.id;

--
-- Plocklista
--
DROP VIEW IF EXISTS v_plocklista;

CREATE VIEW v_plocklista
AS
SELECT
order_id AS OrderID,
produkt_id AS ProduktID,
kvantitet AS Antal,
-- (SELECT sum(kvantitet) FROM order2produkt WHERE produkt_id = produkt2lager.produkt_id_lag GROUP BY produkt_id) AS Antal,
GROUP_CONCAT(DISTINCT produkt2lager.hylla_id, '(', produkt2lager.antal, ')' SEPARATOR ', ') AS Hylla,
(SELECT sum(antal) FROM produkt2lager WHERE produkt_id_lag = produkt_id GROUP BY produkt_id_lag) AS Lagersaldo
FROM order2produkt

LEFT OUTER JOIN produkt2lager
ON produkt2lager.produkt_id_lag = produkt_id
GROUP BY order_id, kvantitet, produkt_id
ORDER BY order_id
;

SELECT * FROM v_plocklista;

--
-- Procedures
--

--
-- Create customers
--
DROP PROCEDURE IF EXISTS create_kund;
DELIMITER ;;
CREATE PROCEDURE create_kund(
    a_fornamn VARCHAR(45),
    a_efternamn VARCHAR(45),
    a_adress VARCHAR(45),
    a_postnummer VARCHAR(45),
    a_ort VARCHAR(45),
    a_land VARCHAR(45),
    a_telefon VARCHAR(45)
)
BEGIN
    INSERT INTO kund VALUES (
        a_fornamn,
        a_efternamn,
        a_adress,
        a_postnummer,
        a_ort,
        a_land,
        a_telefon
    );
END
;;
DELIMITER ;

--
-- Create new product
--
DROP PROCEDURE IF EXISTS create_product;
DELIMITER ;;
CREATE PROCEDURE create_product(
    a_namn VARCHAR(45),
    a_pris DECIMAL(18,2),
    a_bild_lank VARCHAR(45),
    a_beskrivning VARCHAR(45)
)
BEGIN
    INSERT INTO produkt (namn, pris, bild_lank, beskrivning) VALUES (
        a_namn,
        a_pris,
        a_bild_lank,
        a_beskrivning
    );
END
;;
DELIMITER ;

--
-- show produkt table
--
DROP PROCEDURE IF EXISTS show_produkt_table;
DELIMITER ;;
CREATE PROCEDURE show_produkt_table()
BEGIN
    SELECT * FROM produkt;
END
;;
DELIMITER ;

--
-- Update a product
--
DROP PROCEDURE IF EXISTS update_product;
DELIMITER ;;
CREATE PROCEDURE update_product(
    a_id INT,
    a_namn VARCHAR(45),
    a_pris DECIMAL(18,2),
    a_bild_lank VARCHAR(45),
    a_beskrivning VARCHAR(45)
)
BEGIN
    UPDATE produkt
    SET
        namn = a_namn,
        pris = a_pris,
        bild_lank = a_bild_lank,
        beskrivning = a_beskrivning
    WHERE
        id = a_id;
END
;;
DELIMITER ;

--
-- Delete product
--
DROP PROCEDURE IF EXISTS delete_product;
DELIMITER ;;
CREATE PROCEDURE delete_product(a_product_id INT)
BEGIN
    DELETE FROM order2produkt WHERE produkt_id = a_product_id;
    DELETE FROM produkt2kategori WHERE produkt_id_kat = a_product_id;
    DELETE FROM produkt2lager WHERE produkt_id_lag = a_product_id;
    DELETE FROM produkt WHERE id = a_product_id;
END
;;
DELIMITER ;

--
-- show specific produkt
--
DROP PROCEDURE IF EXISTS show_produkt_info;
DELIMITER ;;
CREATE PROCEDURE show_produkt_info(product_id INT)
BEGIN
    SELECT * FROM produkt WHERE id = product_id;
END
;;
DELIMITER ;

--
-- show categories
--
DROP PROCEDURE IF EXISTS show_categories;
DELIMITER ;;
CREATE PROCEDURE show_categories()
BEGIN
    SELECT * FROM kategori;
END
;;
DELIMITER ;

--
-- show products
--
DROP PROCEDURE IF EXISTS show_products;
DELIMITER ;;
CREATE PROCEDURE show_products()
BEGIN
    SELECT * FROM v_produkt;
END
;;
DELIMITER ;

--
-- show log with limit
--
DROP PROCEDURE IF EXISTS show_log;
DELIMITER ;;
CREATE PROCEDURE show_log(_num INT)
BEGIN
    SELECT id, DATE_FORMAT(tid, '%Y-%m-%d %H:%i:%s') AS 'Time', handelse FROM logg
    ORDER BY id DESC
    LIMIT _num;
END
;;
DELIMITER ;

--
-- show available shelves
--
DROP PROCEDURE IF EXISTS show_shelf;
DELIMITER ;;
CREATE PROCEDURE show_shelf()
BEGIN
    SELECT * FROM lager
    ORDER BY hylla;
END
;;
DELIMITER ;

--
-- show inventory
--
DROP PROCEDURE IF EXISTS show_inventory;
DELIMITER ;;
CREATE PROCEDURE show_inventory()
BEGIN
    SELECT id, namn, Hylla, Lagersaldo FROM v_produkt;
END
;;
DELIMITER ;

--
-- show product inventory
--
DROP PROCEDURE IF EXISTS filter_inventory;
DELIMITER ;;
CREATE PROCEDURE filter_inventory(_fltr VARCHAR(45))
BEGIN
    SELECT id, namn, Hylla, Lagersaldo
    FROM v_produkt
    WHERE id = _fltr OR namn LIKE CONCAT('%',_fltr,'%')  OR Hylla = _fltr;
END
;;
DELIMITER ;

--
-- add inventory
--
DROP PROCEDURE IF EXISTS add_inv;
DELIMITER ;;
CREATE PROCEDURE add_inv(
    _id INT,
    _hylla_id VARCHAR(45),
    _antal INT)
BEGIN
    IF (
        SELECT antal
        FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id)

        THEN
        UPDATE produkt2lager
        SET antal = antal + _antal
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;

        ELSE
        INSERT INTO produkt2lager
        VALUES(_id, _antal, _hylla_id);
	END IF;
END
;;
DELIMITER ;

--
-- del inventory
--
DROP PROCEDURE IF EXISTS del_inv;
DELIMITER ;;
CREATE PROCEDURE del_inv(
    _id INT,
    _hylla_id VARCHAR(45),
    _antal INT)
BEGIN
    IF (
        (SELECT antal
        FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id) - _antal <= 0)

        THEN
        DELETE FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;

        ELSE
        UPDATE produkt2lager
        SET antal = antal - _antal
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;
    END IF;
END
;;
DELIMITER ;

--
-- show customers
--
DROP PROCEDURE IF EXISTS show_customers;
DELIMITER ;;
CREATE PROCEDURE show_customers()
BEGIN
    SELECT * FROM kund
    ORDER BY id;
END
;;
DELIMITER ;

--
-- show orders
--
DROP PROCEDURE IF EXISTS show_orders;
DELIMITER ;;
CREATE PROCEDURE show_orders()
BEGIN
    SELECT
    id,
    created,
    kund_id,
    kund_namn,
    order_rows,
    order_status
    FROM v_orders;
END
;;
DELIMITER ;

--
-- show specific order
--
DROP PROCEDURE IF EXISTS show_order;
DELIMITER ;;
CREATE PROCEDURE show_order(_id INT)
BEGIN
    SELECT
    id,
    created,
    kund_id,
    kund_namn,
    order_rows,
    order_status
    FROM v_orders
    WHERE id = _id OR kund_id = _id;
END
;;
DELIMITER ;

--
-- Create new order
--
DROP PROCEDURE IF EXISTS create_order;
DELIMITER ;;
CREATE PROCEDURE create_order(
    a_id INT
)
BEGIN
    INSERT INTO orders (kund_id, order_status) VALUES (
        a_id,
        order_status(now(), NULL, NULL, NULL, NULL)
    );
END
;;
DELIMITER ;

--
-- Build order
--
DROP PROCEDURE IF EXISTS build_order;
DELIMITER ;;
CREATE PROCEDURE build_order(
    a_id INT,
    a_produkt_id INT,
    a_kvantitet INT
)
BEGIN
    INSERT INTO order2produkt VALUES (
        a_id,
        a_produkt_id,
        a_kvantitet
    );
    UPDATE orders
    SET order_updated = NOW()
    WHERE id = a_id;
    CALL update_order_status(a_id);
END
;;
DELIMITER ;

--
-- Show specific order details
--
DROP PROCEDURE IF EXISTS view_order;
DELIMITER ;;
CREATE PROCEDURE view_order(_id INT)
BEGIN
    SELECT * FROM v_order_details WHERE id = _id;
END
;;
DELIMITER ;

--
-- Update order status
--
DROP PROCEDURE IF EXISTS update_order_status;
DELIMITER ;;
CREATE PROCEDURE update_order_status(_id INT)
BEGIN
    UPDATE orders SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- Place order and change status
--
DROP PROCEDURE IF EXISTS place_order;
DELIMITER ;;
CREATE PROCEDURE place_order(_id INT)
BEGIN
    UPDATE orders
    SET order_placed = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- Delete order and change status
--
DROP PROCEDURE IF EXISTS delete_order;
DELIMITER ;;
CREATE PROCEDURE delete_order(_id INT)
BEGIN
    UPDATE orders
    SET order_deleted = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- Undelete order and change status
--
DROP PROCEDURE IF EXISTS un_delete_order;
DELIMITER ;;
CREATE PROCEDURE un_delete_order(_id INT)
BEGIN
    UPDATE orders
    SET order_deleted = NULL
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- Show plocklista
--
DROP PROCEDURE IF EXISTS view_plocklista;
DELIMITER ;;
CREATE PROCEDURE view_plocklista(_id INT)
BEGIN
    SELECT
    ProduktID,
    Antal,
    Hylla,
    IF(Lagersaldo > 0, Lagersaldo, 'Slut i lager') AS Lagersaldo
    FROM v_plocklista
    WHERE OrderID = _id;
END
;;
DELIMITER ;

--
-- Stock update
--
DROP PROCEDURE IF EXISTS stock_update;
DELIMITER ;;
CREATE PROCEDURE stock_update(
    _id INT)
BEGIN
	SELECT * FROM produkt2lager
	WHERE produkt_id_lag = _id
    ORDER BY hylla_id;
END
;;
DELIMITER ;

--
-- Send order and change status
--
DROP PROCEDURE IF EXISTS send_order;
DELIMITER ;;
CREATE PROCEDURE send_order(_id INT)
BEGIN
    UPDATE orders
    SET order_sent = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END
;;
DELIMITER ;

--
-- Triggers
--
DROP TRIGGER IF EXISTS log_product_insert;
DROP TRIGGER IF EXISTS log_lager_insert;
DROP TRIGGER IF EXISTS log_product_update;
DROP TRIGGER IF EXISTS log_lager_update;
DROP TRIGGER IF EXISTS log_product_delete;
DROP TRIGGER IF EXISTS log_lager_delete;

CREATE TRIGGER log_product_insert
AFTER INSERT
ON produkt FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris));

CREATE TRIGGER log_lager_insert
AFTER INSERT
ON produkt2lager FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Inventory added: ',
            NEW.produkt_id_lag,
            ', quantity: ',
            NEW.antal,
            ' on shelf ',
            NEW.hylla_id));

CREATE TRIGGER log_product_update
AFTER UPDATE
ON produkt FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, Before: id = ',
            OLD.id,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            ' After: id = ',
            NEW.id,
            ', ',
            NEW.namn,
            ', ',
            NEW.pris
        ));

CREATE TRIGGER log_lager_update
AFTER UPDATE
ON produkt2lager FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Inventory updated: ',
            NEW.produkt_id_lag,
            ', quantity: ',
            NEW.antal - OLD.antal,
            ' on shelf ',
            NEW.hylla_id));

CREATE TRIGGER log_product_delete
AFTER DELETE
ON produkt FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn));

CREATE TRIGGER log_lager_delete
AFTER DELETE
ON produkt2lager FOR EACH ROW
    INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Shelf ', OLD.hylla_id,
            ' inventory deleted for product id: ',
            OLD.produkt_id_lag));

--
-- Functions
--

--
-- Order status
--
DROP FUNCTION IF EXISTS order_status;
DELIMITER ;;

CREATE FUNCTION order_status(
	_created TIMESTAMP,
    _deleted TIMESTAMP,
    _sent TIMESTAMP,
    _placed TIMESTAMP,
    _updated TIMESTAMP
)
RETURNS CHAR(10)
DETERMINISTIC
BEGIN
    IF _created THEN
		IF _deleted THEN
		RETURN 'Raderad';
        ELSEIF _sent THEN
        RETURN 'Skickad';
        ELSEIF _placed THEN
        RETURN 'Beställd';
        ELSEIF _updated > _created THEN
        RETURN 'Updated';
		ELSE RETURN 'Skapad';
        END IF;
	END IF;
END
;;

DELIMITER ;
