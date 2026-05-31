# Banking System Project
CREATE DATABASE banking_system;
USE banking_system;
#create  customer table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);
# create accont tablee
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);
#Create Transactions Table
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date DATE,

    FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);

INSERT INTO customers (customer_name, city, phone)
VALUES
('Aman', 'Delhi', '9876543210'),
('Rahul', 'Mumbai', '9876543211');
INSERT INTO accounts (customer_id, account_type, balance)
VALUES
(1, 'Savings', 50000),
(2, 'Current', 75000);
INSERT INTO transactions
(account_id, transaction_type, amount, transaction_date)
VALUES
(1, 'Deposit', 10000, '2025-05-20'),
(1, 'Withdraw', 5000, '2025-05-21'),
(2, 'Deposit', 20000, '2025-05-21');
SELECT * FROM customers;
SELECT * FROM accounts;
SELECT customers.customer_name,
       accounts.account_type,
       accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id;
SELECT customers.customer_name,
       accounts.account_type,
       accounts.balance
FROM customers
JOIN accounts
ON customers.customer_id = accounts.customer_id;
SELECT SUM(balance) AS total_bank_balance
FROM accounts;
SELECT * FROM accounts
ORDER BY balance DESC
LIMIT 1;
UPDATE accounts
SET balance = balance + 5000
WHERE account_id = 1;
UPDATE accounts
SET balance = balance - 3000
WHERE account_id = 1;
SELECT customers.customer_name,
       transactions.transaction_type,
       transactions.amount,
       transactions.transaction_date
FROM transactions
JOIN accounts
ON transactions.account_id = accounts.account_id
JOIN customers
ON accounts.customer_id = customers.customer_id;
