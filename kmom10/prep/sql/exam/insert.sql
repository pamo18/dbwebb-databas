--
-- Paul Moreland
-- pamo18
-- 2019/03/28
--

--
-- Insert values into table larare.
-- By Paul Moreland for course databas.
-- 2019-01-23
--

--
--  Empty the table first
--
DELETE FROM sushi;

INSERT INTO sushi
    (name, details, sushi_date, image)
VALUES
    ('Garlic', 'Sushi with garlic, smells lovely.', '2019-03-01', '/img/garlic.jpg'),
    ('Chilli', 'Sushi with chilli, spicy.', '2019-03-01', '/img/chilli.jpg'),
    ('Plain', 'Sushi au natural, fish and rice.', '2019-03-01', '/img/plain.jpg'),
    ('Chocolate', 'Sushi with dark chocolate, sweet.', '2019-03-28', '/img/chocolate.jpg'),
    ('Cheese', 'Sushi with brie cheese, creamy.', '2019-03-28', '/img/cheese.jpg')
;

--
--  Empty the table first
--
DELETE FROM competition;

INSERT INTO competition
    (name, details, comp_date)
VALUES
    ('Tokyo', 'The biggest of them all!', '2019-03-01'),
    ('Osaka', 'Sushi with a twist.', '2019-03-28')
;

--
--  Empty the table first
--
DELETE FROM sushi2competition;

INSERT INTO sushi2competition
    (competition_id, sushi_id)
VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '1'),
    ('2', '4'),
    ('2', '5')
;
