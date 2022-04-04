CREATE TABLE IF NOT EXISTS Items (
itemId integer NOT NULL PRIMARY KEY,
itemName text NOT NULL,
price float NOT NULL
);

CREATE TABLE IF NOT EXISTS Customers (
customerId integer NOT NULL PRIMARY KEY,
customerName text NOT NULL,
city text NOT NULL
);

CREATE TABLE IF NOT EXISTS Orders (
id integer NOT NULL PRIMARY KEY generated by default as identity,
orderId integer NOT NULL,
date text NOT NULL,
customerId integer NOT NULL,
itemId integer NOT NULL,
quant integer NOT NULL,
FOREIGN KEY(customerId) REFERENCES Customers(customerId),
FOREIGN KEY(itemId) REFERENCES Items(itemId)
);

INSERT INTO Items(itemId, itemName, price)
VALUES (3786, 'Net', 35.00);
INSERT INTO Items(itemId, itemName, price)
VALUES (4011, 'Racket', 65.00);
INSERT INTO Items(itemId, itemName, price)
VALUES (9132, 'Pack-3', 4.75);
INSERT INTO Items(itemId, itemName, price)
VALUES (5794, 'Pack-6', 5.00);
INSERT INTO Items(itemId, itemName, price)
VALUES (3141, 'Cover', 10.00);

INSERT INTO Customers(customerId, customerName, city)
VALUES (101, 'Martin','Prague');
INSERT INTO Customers(customerId, customerName, city)
VALUES (107, 'Herman','Madrid');
INSERT INTO Customers(customerId, customerName, city)
VALUES (110, 'Pedro','Moscow');

INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2301, '23/02/2011',101,3786,3);
INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2301, '23/02/2011',101,4011,6);
INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2301, '23/02/2011',101,9132,8);
INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2302, '25/02/2011',107,5794,4);
INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2303, '27/02/2011',110,4011,2);
INSERT INTO Orders(orderId, date, customerId, itemId, quant)
VALUES (2303, '27/02/2011',110,3141,2);


-- Calculate the total number of items per order and the total amount to pay for the order
SELECT o.orderId, SUM(o.quant), SUM(o.quant*i.price) as Total_Amount
FROM Customers c
INNER JOIN Orders o on c.customerId = o.customerId
INNER JOIN Items i ON c.customerId = o.customerId AND o.itemId = i.itemId
GROUP BY c.customerId,o.orderId
ORDER BY o.orderId;

-- Obtain the customer whose purchase in terms of money has been greater than the others
SELECT c.customerId,o.orderId, SUM(o.quant*i.price) as Total_Amount
FROM Customers c
INNER JOIN Orders o on c.customerId = o.customerId
INNER JOIN Items i ON c.customerId = o.customerId AND o.itemId = i.itemId
GROUP BY c.customerId,o.orderId
ORDER BY Total_Amount desc LIMIT 1;
