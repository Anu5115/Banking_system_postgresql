CREATE TABLE customers(customer_id SERIAL PRIMARY KEY, name VARCHAR(50), dob DATE, email VARCHAR(100), phone CHAR(10), address TEXT);
ALTER TABLE customers
RENAME COLUMN id TO customer_id;
ALTER TABLE customers
ALTER COLUMN phone TYPE TEXT; 
INSERT INTO customers (name, dob, email, phone, address) VALUES
('Ritika Sharma', '1995-04-12', 'ritika.sharma@example.com', '9876543210', '123 Civil Lines, Delhi'),
('Aman Mehta', '1992-11-23', 'aman.mehta@example.com', '9834567890', '45 MG Road, Mumbai'),
('Neha Verma', '1998-06-18', 'neha.verma@example.com', '9823456789', '789 Park Street, Kolkata'),
('Ravi Kumar', '1985-01-30', 'ravi.kumar@example.com', '9845671234', '22 Sector 14, Gurugram'),
('Sneha Iyer', '1990-08-25', 'sneha.iyer@example.com', '9812312312', '101 Anna Nagar, Chennai'),
('Mohit Sinha', '1993-09-15', 'mohit.sinha@example.com', '9809090909', '56 Boring Road, Patna'),
('Anjali Patel', '1996-02-10', 'anjali.patel@example.com', '9871112233', '12 SG Highway, Ahmedabad'),
('Tarun Das', '1991-12-05', 'tarun.das@example.com', '9898765432', '88 Salt Lake, Kolkata'),
('Pooja Reddy', '1994-07-08', 'pooja.reddy@example.com', '9819988776', '77 Jubilee Hills, Hyderabad'),
('Deepak Joshi', '1989-03-20', 'deepak.joshi@example.com', '9888123456', '33 Hawa Mahal Road, Jaipur');
SELECT * FROM customers
CREATE TABLE accounts(id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(customer_id), account_type VARCHAR(50), balance Numeric(10,2), open_date DATE);

INSERT INTO accounts (customer_id, account_type, balance, open_date) VALUES
(7, 'Current', 93429.59, '2017-07-10'),
(1, 'Fixed Deposit', 13076.45, '2015-02-27'),
(9, 'Savings', 36560.39, '2020-06-05'),
(2, 'Current', 34235.31, '2019-09-23'),
(6, 'Fixed Deposit', 99056.97, '2024-10-16'),
(7, 'Savings', 30943.68, '2022-02-25'),
(9, 'Savings', 28779.89, '2023-04-11'),
(2, 'Current', 78255.61, '2021-01-28'),
(5, 'Savings', 29803.18, '2017-03-09'),
(10, 'Current', 61804.67, '2022-09-05'),
(4, 'Fixed Deposit', 65712.38, '2020-08-27'),
(1, 'Savings', 89084.91, '2023-12-04'),
(5, 'Current', 45607.21, '2016-01-12'),
(10, 'Savings', 53976.54, '2024-03-20'),
(8, 'Savings', 53457.66, '2021-05-07');

SELECT * FROM accounts;


CREATE TABLE transactions(id SERIAL PRIMARY KEY, account_id INT REFERENCES accounts(id), type VARCHAR(10), amount NUMERIC(12,2) , timestamp TIMESTAMP);

ALTER TABLE transactions
ADD CONSTRAINT type CHECK(type IN ('credit', 'debit'));

INSERT INTO transactions (account_id, type, amount, timestamp) VALUES
(2, 'debit', 8775.48, '2025-06-01 21:27:00'),
(8, 'debit', 5044.45, '2025-07-08 21:40:00'),
(7, 'debit', 5702.61, '2025-05-17 16:13:00'),
(2, 'credit', 3635.49, '2025-01-18 22:16:00'),
(6, 'credit', 7707.95, '2025-01-10 15:26:00'),
(13, 'debit', 6069.01, '2025-03-22 13:37:00'),
(12, 'credit', 843.20, '2025-05-05 12:44:00'),
(3, 'debit', 2062.65, '2025-05-21 11:24:00'),
(15, 'debit', 7801.03, '2025-07-16 15:14:00'),
(3, 'debit', 4518.41, '2025-07-16 12:57:00');

SELECT * FROM transactions;

CREATE TABLE loans (id SERIAL PRIMARY KEY, customer_id INT REFERENCES customers(customer_id), amount NUMERIC(12,2), interest_rate NUMERIC(2,2), start_date DATE, duration_in_months);
ALTER TABLE loans
ALTER COLUMN duration_in_months TYPE SMALLINT;
ALTER TABLE loans
ALTER COLUMN interest_rate TYPE NUMERIC(4,2);
SELECT * FROM loans;
INSERT INTO loans (customer_id, amount, interest_rate, start_date, duration_in_months) VALUES
(3, 253421.75, 7.85, '2023-03-15', 36),
(7, 128540.00, 9.25, '2021-06-10', 24),
(1, 459800.50, 6.90, '2022-01-20', 60),
(5, 378000.00, 8.75, '2020-09-05', 48),
(2, 101250.30, 11.00, '2024-02-18', 12),
(9, 150750.00, 5.95, '2023-11-01', 36),
(8, 337900.25, 10.50, '2021-04-12', 48),
(4, 287000.00, 6.75, '2022-07-25', 24),
(10, 195500.90, 7.30, '2020-12-09', 36),
(6, 412350.45, 9.90, '2023-05-22', 60);








