--QUERIES
--Top 5 Customers by Total Account Balance
SELECT c.id, c.name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON c.id = a.customer_id
GROUP BY c.id, c.name
ORDER BY total_balance DESC
LIMIT 5;

--Accounts with Balance Less Than ₹10,000
SELECT a.id, c.name, a.account_type, a.balance
FROM accounts a
JOIN customers c ON a.customer_id = c.id
WHERE a.balance < 10000
ORDER BY a.balance ASC;

--Total Number of Transactions per Account
SELECT a.id AS account_id, COUNT(t.id) AS total_transactions
FROM accounts a
LEFT JOIN transactions t ON a.id = t.account_id
GROUP BY a.id
ORDER BY total_transactions DESC;

--Monthly Transaction Volume
SELECT DATE_TRUNC('month', timestamp) AS month, 
       COUNT(*) AS total_transactions, 
       SUM(amount) AS total_amount
FROM transactions
GROUP BY month
ORDER BY month DESC;

--Loan Summary per Customer
SELECT c.id, c.name, COUNT(l.id) AS total_loans, 
       SUM(l.amount) AS total_loan_amount,
       AVG(l.interest_rate) AS avg_interest_rate
FROM customers c
JOIN loans l ON c.id = l.customer_id
GROUP BY c.id, c.name
ORDER BY total_loan_amount DESC;

--Suspicious Transactions: Amount > ₹50,000
SELECT t.id, t.account_id, c.name, t.type, t.amount, t.timestamp
FROM transactions t
JOIN accounts a ON t.account_id = a.id
JOIN customers c ON a.customer_id = c.id
WHERE t.amount > 50000
ORDER BY t.amount DESC;