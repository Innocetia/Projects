-- 1. INNER JOIN: Orders with Customer and Product Names

-- Question: List all orders along with the customer name and product name.
-- Expected Output Columns:
-- OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT 
    A.orderid,
    A.orderdate,
    B.customername,
    C.productname,
    A.quantity
FROM orders AS A
INNER JOIN customers AS B ON A.customerid = B.customerid
INNER JOIN products AS C ON A.productid = C.productid;
----------------------------------------------------------------------------

-- 2. INNER JOIN: Customers Who Placed Orders
-- Question: Which customers have placed at least one order?
-- Expected Output Columns:
-- •
-- CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT 
    A.customerid,
    A.customername,
    A.country,
    B.orderid,
    B.orderdate

FROM customers AS A
INNER JOIN orders AS B ON A.customerid = B.customerid
INNER JOIN products AS C ON B.productid = C.productid
WHERE quantity >= 1;
--------------------------------------------------------------------------


-- 3. LEFT JOIN: All Customers and Their Orders
-- Question: List all customers and any orders they might have placed. Include customers who have not placed any orders.
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    A.customerid,
    A.customername,
    A.country,
    B.orderid,
    B.orderdate,
    C.productid,
    B.quantity
FROM customers AS A
LEFT JOIN orders AS B ON A.customerid = B.customerid
LEFT JOIN products AS C ON B.productid = C.productid;
----------------------------------------------------------------------------

-- 4. LEFT JOIN: Product Order Count
-- Question: List all products and how many times each was ordered (if any).
-- Expected Output Columns:
-- ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT 
    A.productid,
    A.productname,
    COUNT(A.productname) AS TotalOrders
FROM products AS A
LEFT JOIN orders AS B ON A.productid = B.productid
GROUP BY A.productid, A.productname;
----------------------------------------------------------------------------

-- 5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
-- Question: Find all orders along with product details, including any products that might not have been ordered.
-- Expected Output Columns:
-- OrderID, OrderDate, ProductID, ProductName, Price, Quantity

SELECT 
    A.orderid,
    A.orderdate,
    B.productid,
    B.productname,
    B.price,
    A.quantity
FROM orders AS A
RIGHT JOIN  products AS B 
ON A.productid = B.productid;
----------------------------------------------------------------------------------

-- 6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
-- Question: Which customers have made orders, and include customers even if they have never placed an order.
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    A.customerid,
    A.customername,
    A.country,
    B.orderid,
    B.orderdate,
    B.productid,
    B.quantity
FROM customers AS A
RIGHT JOIN orders AS B 
ON A.customerid = B.customerid;
---------------------------------------------------------------------------------

-- 7. FULL OUTER JOIN: All Customers and All Orders
-- Question: List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.
-- Expected Output Columns:
-- CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT 
    A.customerid,
    A.customername,
    A.country,
    B.orderid,
    B.orderdate,
    B.productid,
    B.quantity
FROM customers AS A
FULL OUTER JOIN orders AS B 
ON A.customerid = B.customerid;
-------------------------------------------------------------------------------

-- 8. FULL OUTER JOIN: All Products and Orders
-- Question: List all products and orders, showing NULLs where products were never ordered or orders are missing product info.
-- Expected Output Columns:
-- ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT
    A.productid,
    A.productname,
    A.price,
    B.orderid,
    B.orderdate,
    B.customerid,
    B.quantity
FROM products AS A
FULL OUTER JOIN orders AS B
ON A.productid = B.productid;