CREATE DATABASE REAL_ESTATE;

USE REAL_ESTATE;

-- Properties Table
CREATE TABLE Properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    zip_code VARCHAR(20) NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    type VARCHAR(50) NOT NULL,  -- e.g., Residential, Commercial
    status VARCHAR(20) NOT NULL  -- e.g., Available, Sold
);


-- Agents
CREATE TABLE Agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL
);


-- Location Features Table
CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL
);

-- transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    client_id INT NOT NULL,
    agent_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_amount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (agent_id) REFERENCES Agents(agent_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT NOT NULL,
    client_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (property_id) REFERENCES Properties(property_id),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);


INSERT INTO Properties (address, city, state, zip_code, price, type, status) 
VALUES
('101 MAIN', 'CHANDIGARH', 'CHANDIGARH', '160101', 1500000.00, 'Residential', 'Available'),
('202 5TH', 'MOHALI', 'PUNJAB', '160071', 950000.00, 'Residential', 'Available'),
('303 PARK', 'ZIRAKPUR', 'PUNJAB', '140603', 1750000.00, 'Commercial', 'Sold'),
('404 OAK', 'PANCHKULA', 'HARYANA', '134113', 2200000.00, 'Residential', 'Available'),
('505 LAKE', 'AMBALA', 'HARYANA', '133001', 1200000.00, 'Commercial', 'Available'),
('606 SUNSET', 'MOHALI', 'PUNJAB', '160069', 1300000.00, 'Residential', 'Sold'),
('707 ROSE', 'ZIRAKPUR', 'PUNJAB', '140605', 1100000.00, 'Residential', 'Available'),
('808 HIGHWAY', 'PANCHKULA', 'HARYANA', '134201', 1800000.00, 'Commercial', 'Available'),
('909 RIDGE', 'CHANDIGARH', 'CHANDIGARH', '160017', 2100000.00, 'Residential', 'Sold'),
('1001 GREEN', 'MOHALI', 'PUNJAB', '160069', 1250000.00, 'Residential', 'Available');

INSERT INTO Agents (first_name, last_name, email, phone) 
VALUES
('SAHIL', 'DAWRA', 'sahildawra12@example.com', '6587458962'),
('MANISH', 'GABA', 'manishgaba@example.com', '9587462587'),
('SAKSHAM', 'KUKKAR', 'sakshamkukkar@example.com', '6874589632'),
('PRIYA', 'SHARMA', 'priyasharma@example.com', '9876543210'),
('VIKRAM', 'SINGH', 'vikramsingh@example.com', '9912345678'),
('NEHA', 'AGGARWAL', 'nehaaggarwal@example.com', '9456781234'),
('RAJEEV', 'VERMA', 'rajeevverma@example.com', '8998765432'),
('TANVI', 'JAIN', 'tanvijain@example.com', '9632587410'),
('KUNAL', 'YADAV', 'kunalyadav@example.com', '9123456789'),
('RAVI', 'MALHOTRA', 'ravimalhotra@example.com', '8712345670');

INSERT INTO Clients (first_name, last_name, email, phone) 
VALUES

('ANSHIKA', 'JAIN', 'anshikajain@example.com', '9612345876'),
('MANPREET', 'SINGH', 'manpreetsingh@example.com', '9658743210'),
('PRIYANKA', 'SHARMA', 'priyankasharma@example.com', '9445738912'),
('TARUN', 'GUPTA', 'tarungupta@example.com', '9734528761'),
('NISHA', 'PAREKH', 'nishaparekh@example.com', '9812365470'),
('AMIT', 'YADAV', 'amityadav@example.com', '9214785630'),
('MAYANK', 'RANA', 'mayankrana@example.com', '9356162974');



INSERT INTO Transactions (property_id, client_id, agent_id, transaction_date, transaction_amount) 
VALUES
(1, 1, 1, '2023-01-15', 1200000.00),
(2, 2, 2, '2023-02-20', 850000.00),
(3, 3, 3, '2023-03-10', 2000000.00),
(4, 4, 4, '2023-04-05', 2200000.00),
(5, 5, 5, '2023-05-12', 1200000.00),
(6, 6, 6, '2023-06-18', 1300000.00),
(7, 7, 7, '2023-07-25', 1100000.00),
(8, 8, 8, '2023-08-30', 1800000.00),
(9, 9, 9, '2023-09-14', 2100000.00),
(10, 10, 10, '2023-10-22', 1250000.00);



INSERT INTO Reviews (property_id, client_id, rating, comments) 
VALUES
(1, 1, 5, 'Amazing property, highly recommend!'),
(1, 2, 4, 'Great location, but a bit pricey.'),
(2, 1, 5, 'Very satisfied with the purchase.'),
(3, 3, 4, 'The commercial space is good, but needs some updates.'),
(4, 4, 5, 'Perfect family home, exceeded my expectations!'),
(5, 5, 3, 'Good property, but the surrounding area could be better.'),
(6, 6, 5, 'Loved the property! Would definitely invest again.'),
(7, 7, 4, 'Nice location, but the layout could be improved.'),
(8, 8, 5, 'Great deal on this commercial space. Highly recommend!'),
(9, 9, 4, 'Very good residential property, but a little expensive.'),
(10, 10, 5, 'Excellent investment, worth every penny!');




-- 1. Select all properties
SELECT * FROM Properties;


-- 2. Get all agents
SELECT * FROM Agents;


-- 3.  Find properties in a specific city
SELECT * FROM Properties WHERE city = 'MOHALI';


-- 4. Get all transactions for a specific agent
SELECT * FROM Transactions WHERE agent_id = 1;


-- 5. List clients who bought a property
SELECT DISTINCT c.first_name, c.last_name 
FROM Clients c 
JOIN Transactions t ON c.client_id = t.client_id;

-- 6. Update property status after sale
UPDATE Properties SET status = 'Sold' WHERE property_id = 1;
SELECT * FROM Properties;
-- 7. Delete a review
DELETE FROM Reviews WHERE review_id = 1;

-- 8. Get total sales by agent
SELECT agent_id, SUM(transaction_amount) AS total_sales 
FROM Transactions 
GROUP BY agent_id;

-- 9. Find properties sold by an agent in the last month
SELECT * FROM Properties p 
JOIN Transactions t ON p.property_id = t.property_id 
WHERE t.agent_id = 1 AND t.transaction_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- 10. Average price of properties by type
SELECT type, AVG(price) AS avg_price 
FROM Properties 
GROUP BY type;

-- 11. Get clients who left a review
SELECT DISTINCT c.first_name, c.last_name 
FROM Clients c 
JOIN Reviews r ON c.client_id = r.client_id;

-- 12. using rollup operation
SELECT city, status, COUNT(*) AS total_properties
FROM Properties
GROUP BY city, status WITH ROLLUP;

-- 13. aggregate functions
SELECT AVG(price) AS average_price FROM Properties;  -- Average property price

-- 14. Grouping the Result of a Query
SELECT status, COUNT(*) AS total_properties
FROM Properties
GROUP BY status;  -- Count properties by their status

-- 15. EquiJoins
SELECT a.first_name, a.last_name, t.transaction_amount
FROM Agents a
JOIN Transactions t ON a.agent_id = t.agent_id;


-- 16. outerjoin
SELECT c.first_name, c.last_name, r.rating
FROM Clients c
LEFT JOIN Reviews r ON c.client_id = r.client_id;

-- 17. self join
SELECT a1.first_name AS Agent1, a2.first_name AS Agent2
FROM Agents a1
JOIN Agents a2 ON a1.agent_id <> a2.agent_id;

-- 18. union
SELECT email FROM Clients
UNION
SELECT email FROM Agents;  -- Unique emails from both tables

-- 19. intersect 
SELECT client_id
FROM Reviews
INTERSECT
SELECT client_id
FROM Transactions;  -- Clients who have both reviewed and transacted


 -- 20. GRANT Command: To give privileges to a user.
GRANT SELECT, INSERT ON Properties TO some_user;

-- 21. Revoke Command: to remove priveleges from a user. 
REVOKE INSERT ON Properties FROM some_user;

-- 22. COMMIT: To save changes to the database.
COMMIT;

-- 23.  ROLLBACK: To undo changes made in the current transaction.
ROLLBACK;

-- plsql

-- 1. Stored Procedure to Add a New Property
DELIMITER $$

CREATE PROCEDURE AddNewProperty(
    IN p_address VARCHAR(255),
    IN p_city VARCHAR(100),
    IN p_state VARCHAR(100),
    IN p_zip_code VARCHAR(20),
    IN p_price DECIMAL(15, 2),
    IN p_type VARCHAR(50),
    IN p_status VARCHAR(20)
)
BEGIN
    INSERT INTO Properties (address, city, state, zip_code, price, type, status)
    VALUES (p_address, p_city, p_state, p_zip_code, p_price, p_type, p_status);
END $$

DELIMITER ;

CALL AddNewProperty('101 Main Street', 'Chandigarh', 'Punjab', '160101', 1500000.00, 'Residential', 'Available');

-- 2. Stored Procedure to Update Property Status
DELIMITER $$

CREATE PROCEDURE UpdatePropertyStatus(
    IN p_property_id INT,
    IN p_status VARCHAR(20)
)
BEGIN
    UPDATE Properties
    SET status = p_status
    WHERE property_id = p_property_id;
END $$

DELIMITER ;

CALL UpdatePropertyStatus(3, 'Sold');



-- 3. Function to Calculate Average Rating for a Property
DELIMITER $$

CREATE FUNCTION GetAverageRating(p_property_id INT) 
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE avg_rating DECIMAL(5,2);
    
    SELECT AVG(rating) INTO avg_rating
    FROM Reviews
    WHERE property_id = p_property_id;

    RETURN avg_rating;
END $$

DELIMITER ;

SELECT GetAverageRating(1);  -- Returns the average rating for property with ID 1


-- 4. Trigger to Ensure Price Is Positive
DELIMITER $$

CREATE TRIGGER PriceCheckBeforeInsert
BEFORE INSERT ON Properties
FOR EACH ROW
BEGIN
    IF NEW.price <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Price must be a positive value';
    END IF;
END $$

DELIMITER ;


-- 5. Trigger to Update Transaction Amount When Property Price Changes
DELIMITER $$

CREATE TRIGGER UpdateTransactionAmount
AFTER UPDATE ON Properties
FOR EACH ROW
BEGIN
    IF OLD.price != NEW.price THEN
        UPDATE Transactions
        SET transaction_amount = NEW.price
        WHERE property_id = NEW.property_id AND transaction_amount = OLD.price;
    END IF;
END $$

DELIMITER ;


-- 6. Stored Procedure to Record a New Transaction
DELIMITER $$

CREATE PROCEDURE RecordNewTransaction(
    IN p_property_id INT,
    IN p_client_id INT,
    IN p_agent_id INT,
    IN p_transaction_date DATE,
    IN p_transaction_amount DECIMAL(15, 2)
)
BEGIN
    INSERT INTO Transactions (property_id, client_id, agent_id, transaction_date, transaction_amount)
    VALUES (p_property_id, p_client_id, p_agent_id, p_transaction_date, p_transaction_amount);
    
    -- Optional: Automatically mark the property as 'Sold' after a transaction
    UPDATE Properties
    SET status = 'Sold'
    WHERE property_id = p_property_id;
END $$

DELIMITER ;

CALL RecordNewTransaction(1, 1, 1, '2024-10-25', 1200000.00);


-- 7. Trigger to Add Review Validation
DELIMITER $$

CREATE TRIGGER ValidateReviewBeforeInsert
BEFORE INSERT ON Reviews
FOR EACH ROW
BEGIN
    DECLARE property_status VARCHAR(20);
    
    -- Get the status of the property
    SELECT status INTO property_status
    FROM Properties
    WHERE property_id = NEW.property_id;

    IF property_status != 'Sold' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Reviews can only be added for properties that are sold.';
    END IF;
END $$

DELIMITER ;


-- 8. Stored Procedure to Get Properties by Type
DELIMITER $$

CREATE PROCEDURE GetPropertiesByType(IN p_type VARCHAR(50))
BEGIN
    SELECT * FROM Properties
    WHERE type = p_type;
END $$

DELIMITER ;

CALL GetPropertiesByType('Residential');	










