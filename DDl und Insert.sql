CREATE TABLE Member (
member_id INT PRIMARY KEY,
email VARCHAR(100),
password VARCHAR(100),
name VARCHAR(45) NOT NULL,
buyer_id INT NOT NULL,
seller_id INT NOT NULL,
city VARCHAR(255), 
state VARCHAR(255),
Zipcode VARCHAR(5)
);

CREATE TABLE Buyer (
buyer_id INT PRIMARY KEY,
shipping_address VARCHAR(255)
);

CREATE TABLE Seller (
seller_id INT PRIMARY KEY,
bankaccount_num VARCHAR(22),
routing_num VARCHAR(12)
); 


CREATE TABLE Category (
category_id INT PRIMARY KEY,
name VARCHAR(45) NOT NULL
);


CREATE TABLE Item (
item_id INT PRIMARY KEY,
category_id INT NOT NULL,
seller_id INT NOT NULL,
FOREIGN KEY (category_id) REFERENCES Category(category_id),
FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
bidding_increment VARCHAR,
titel VARCHAR(255),
item_description VARCHAR(255),
start_date DATE,
end_date DATE,
starting_bid_price_EUR INT
);
 

CREATE TABLE Watchlist (
watchlist_id INT PRIMARY KEY,
starting_bid_price_EUR INT,
watchlist_date DATE,
buyer_id INT NOT NULL,
item_id INT NOT NULL,
FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id),
FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

CREATE TABLE Bid (
bid_id INT PRIMARY KEY,
buyer_id INT NOT NULL, 
item_id INT NOT NULL,
FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id),
FOREIGN KEY (item_id) REFERENCES Item(item_id),
bid_time TIME, 
winning BOOLEAN,
bid_prize_EUR INT
);

CREATE TABLE Transaction (
transaction_id INT PRIMARY KEY,
buyer_id INT NOT NULL,
seller_id INT NOT NULL,
item_id INT NOT NULL,
FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id),
FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

CREATE TABLE Feedback (
feedback_id INT PRIMARY KEY,
buyer_id INT NOT NULL,
seller_id INT NOT NULL,
transaction_id INT NOT NULL,
FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id),
FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
FOREIGN KEY (transaction_id) REFERENCES transaction(transaction_id),
comment_buyer VARCHAR(255),
comment_seller VARCHAR(255),
rating_buyer INT, 
rating_seller INT
);

CREATE TABLE Shipping (
shipping_id INT PRIMARY KEY,
transaction_id INT NOT NULL,
FOREIGN KEY (transaction_id) REFERENCES Transaction(transaction_id),
shipping_address VARCHAR(255), 
shipping_date DATE,
shipping_methode VARCHAR(266)
);



-- Daten für Memeber
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (1, 'alex.max@.com', 'Clown', 'Alex Max', '1', '2', 'Kaufland', 'Singapore', '44556');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (2, 'sara.jane@.com', 'Password123', 'Sara Jane', '3', '4', 'Walmart', 'New York', '11223');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (3, 'john.doe@.com', 'SecretPass', 'John Doe', '5', '6', 'Tesco', 'London', 'WC1E');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (4, 'Anna.bee@.com', 'Safer', 'Anna Bee', '7', '8', 'Shell', 'Bangkok', '8876');

-- Daten für Buyer
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (1, '123 Main Street, Anytown, USA');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (2, '456 Elm Street, Othertown, USA');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (3, '777 Street, Nowhere, Germany');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (4, '323 Baker Street, California, USA');

-- Daten für Seller
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (1, 'DE1234567890', '987654321');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (2, 'DE0987654321', '123456789');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (3, 'DE9988776655', '862435261');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (4, 'DE7564694321', '194378789');

-- Daten für Category
INSERT INTO Category(category_id, name)VALUES (1, 'Electronics');
INSERT INTO Category(category_id, name)VALUES (2, 'Clothing');
INSERT INTO Category(category_id, name)VALUES (3, 'Art');
INSERT INTO Category(category_id, name)VALUES (4, 'Furniture');


-- Daten für Tabelle Item
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (1, 1, 1, 100, 'Smartphone', 'Brand new smartphone', '2024-02-20', '2024-02-25', 200);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (2, 2, 4, 20, 'T-shirt', 'Designer T-shirt', '2024-02-21', '2024-02-26', 50);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (3, 3, 3, 2000, 'Mona Lisa', 'Work of art by Van Gogh', '2024-06-30', '2024-08-25', 3000);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (4, 4, 2, 200, 'Desk', 'Ornate oak table', '2024-02-21', '2025-02-26', 300);


-- Daten für Watchlist
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (1, 200, '2024-02-19', 1, 1);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (2, 50, '2024-02-20', 2, 2);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (3, 3000, '2024-04-23', 3, 4);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (4, 300, '2024-01-26', 4, 3);

-- Daten für Bid
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (1, 1, 1, '19:30:10', TRUE, 220);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (2, 2, 3, '17:25:30', TRUE, 60);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (3, 3, 4, '20:45:60', TRUE, 4000);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (4, 4, 2, '18:20:50', False, 380);

-- Daten für Transaction
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (1, 4, 1, 1);
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (2, 3, 2, 4);


-- Daten für Feedback
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (1, 1, 1, 1, 'Great seller, fast shipping!', 'Great buyer, smooth transaction!', 5, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (2, 4, 4, 2, 'Item as described, thank you!', 'Excellent buyer, prompt payment!', 4, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (3, 3, 2, 1, 'Great seller, fast shipping!', 'Great buyer, smooth transaction!', 5, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (4, 2, 3, 2, 'Item as described, thank you!', 'Excellent buyer, prompt payment!', 4, 5);

-- Daten für Tabelle Shipping
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (1, 1, '123 Main Street, Anytown, USA', '2024-02-25', 'Express');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (2, 2, '456 Elm Street, Othertown, USA', '2024-02-26', 'Standard');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (3, 4, '777 Street, Nowhere, Germany', '2024-04-25', 'Express');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (4, 3, '323 Baker Street, California, USA', '2024-02-23', 'Standard');
-- Daten für Memeber
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (1, 'alex.max@.com', 'Clown', 'Alex Max', '1', '2', 'Kaufland', 'Singapore', '44556');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (2, 'sara.jane@.com', 'Password123', 'Sara Jane', '3', '4', 'Walmart', 'New York', '11223');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (3, 'john.doe@.com', 'SecretPass', 'John Doe', '5', '6', 'Tesco', 'London', 'WC1E');
INSERT INTO Member(member_id, email, password, name, buyer_id, seller_id, city, state, Zipcode) VALUES (4, 'Anna.bee@.com', 'Safer', 'Anna Bee', '7', '8', 'Shell', 'Bangkok', '8876');

-- Daten für Buyer
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (1, '123 Main Street, Anytown, USA');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (2, '456 Elm Street, Othertown, USA');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (3, '777 Street, Nowhere, Germany');
INSERT INTO Buyer(buyer_id, shipping_address) VALUES (4, '323 Baker Street, California, USA');

-- Daten für Seller
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (1, 'DE1234567890', '987654321');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (2, 'DE0987654321', '123456789');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (3, 'DE9988776655', '862435261');
INSERT INTO Seller(seller_id, bankaccount_num, routing_num) VALUES (4, 'DE7564694321', '194378789');

-- Daten für Category
INSERT INTO Category(category_id, name)VALUES (1, 'Electronics');
INSERT INTO Category(category_id, name)VALUES (2, 'Clothing');
INSERT INTO Category(category_id, name)VALUES (3, 'Art');
INSERT INTO Category(category_id, name)VALUES (4, 'Furniture');


-- Daten für Tabelle Item
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (1, 1, 1, 100, 'Smartphone', 'Brand new smartphone', '2024-02-20', '2024-02-25', 200);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (2, 2, 4, 20, 'T-shirt', 'Designer T-shirt', '2024-02-21', '2024-02-26', 50);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (3, 3, 3, 2000, 'Mona Lisa', 'Work of art by Van Gogh', '2024-06-30', '2024-08-25', 3000);
INSERT INTO Item(item_id, category_id, seller_id, bidding_increment, titel, description, start_date, end_date, starting_bid_price_EUR) VALUES (4, 4, 2, 200, 'Desk', 'Ornate oak table', '2024-02-21', '2025-02-26', 300);


-- Daten für Watchlist
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (1, 200, '2024-02-19', 1, 1);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (2, 50, '2024-02-20', 2, 2);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (3, 3000, '2024-04-23', 3, 4);
INSERT INTO Watchlist(watchlist_id, starting_bid_price_eur, watchlist_date, buyer_id, item_id) VALUES (4, 300, '2024-01-26', 4, 3);

-- Daten für Bid
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (1, 1, 1, '19:30:10', TRUE, 220);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (2, 2, 3, '17:25:30', TRUE, 60);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (3, 3, 4, '20:45:60', TRUE, 4000);
INSERT INTO Bid(bid_id, buyer_id, item_id, bid_time, winning, bid_prize_eur) VALUES (4, 4, 2, '18:20:50', False, 380);

-- Daten für Transaction
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (1, 1, 3, 1);
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (2, 2, 4, 2);
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (3, 4, 1, 4);
INSERT INTO Transaction(transaction_id, buyer_id, seller_id, item_id) VALUES (4, 3, 2, 3);

-- Daten für Feedback
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (1, 1, 1, 1, 'Great seller, fast shipping!', 'Great buyer, smooth transaction!', 5, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (2, 4, 4, 2, 'Item as described, thank you!', 'Excellent buyer, prompt payment!', 4, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (3, 3, 2, 1, 'Great seller, fast shipping!', 'Great buyer, smooth transaction!', 5, 5);
INSERT INTO Feedback(feedback_id, buyer_id, seller_id, transaction_id, comment_buyer, comment_seller, rating_buyer, rating_seller) VALUES (4, 2, 3, 2, 'Item as described, thank you!', 'Excellent buyer, prompt payment!', 4, 5);

-- Daten für Tabelle Shipping
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (1, 1, '123 Main Street, Anytown, USA', '2024-02-25', 'Express');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (2, 2, '456 Elm Street, Othertown, USA', '2024-02-26', 'Standard');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (3, 4, '777 Street, Nowhere, Germany', '2024-04-25', 'Express');
INSERT INTO Shipping(shipping_id, transaction_id, shipping_address, shipping_date, shipping_methode) VALUES (4, 3, '323 Baker Street, California, USA', '2024-02-23', 'Standard');

