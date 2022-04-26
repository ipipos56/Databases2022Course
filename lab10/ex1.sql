CREATE TABLE IF NOT EXISTS accounts(
id integer NOT NULL PRIMARY KEY,
name text NOT NULL,
credit integer NOT NULL,
currency text NOT NULL
);

INSERT INTO accounts(id, name, credit, currency)
VALUES (1, 'Yosemite Sham', 1000, 'Rub');
INSERT INTO accounts(id, name, credit, currency)
VALUES (2, 'Wiley E. Coyote', 1000, 'Rub');
INSERT INTO accounts(id, name, credit, currency)
VALUES (3, 'Elmer Fudd', 1000, 'Rub');