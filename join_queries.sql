USE FlipkartDB;

-- 1. INNER JOIN: Orders with user details
SELECT o.order_id, u.name, o.total_amount
FROM Orders o
INNER JOIN Users u ON o.user_id = u.user_id;

-- 2. LEFT JOIN: All users with their orders (if any)
SELECT u.name, o.order_id, o.total_amount
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id;

-- 3. RIGHT JOIN: All orders and their user names (users without orders will show NULL) -- if supported
SELECT u.name, o.order_id, o.total_amount
FROM Users u
RIGHT JOIN Orders o ON u.user_id = o.user_id;

-- 4. FULL OUTER JOIN: Users and orders including unmatched on both sides (use UNION for MySQL)
SELECT u.name, o.order_id, o.total_amount
FROM Users u
LEFT JOIN Orders o ON u.user_id = o.user_id
UNION
SELECT u.name, o.order_id, o.total_amount
FROM Users u
RIGHT JOIN Orders o ON u.user_id = o.user_id;

-- 5. Join 3 tables: Orders with Products through OrderItems
SELECT o.order_id, u.name AS customer, p.name AS product, oi.quantity
FROM Orders o
JOIN Users u ON o.user_id = u.user_id
JOIN OrderItems oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;

-- 6. CROSS JOIN: Every user with every product (be cautious!)
SELECT u.name, p.name
FROM Users u
CROSS JOIN Products p;

-- 7. SELF JOIN: Find users with same address (excluding themselves)
SELECT A.user_id AS user1, B.user_id AS user2, A.address
FROM Users A, Users B
WHERE A.address = B.address AND A.user_id <> B.user_id;