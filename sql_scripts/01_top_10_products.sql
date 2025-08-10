-- Query 1: What are our top 10 best-selling products?
-- This query identifies the top 10 products by the total quantity sold.

SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantitySold
FROM
    Products p
JOIN
    "Order Details" od ON p.ProductID = od.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalQuantitySold DESC
LIMIT 10;