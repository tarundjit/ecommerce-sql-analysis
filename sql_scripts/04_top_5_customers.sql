-- Query 4: Who are the top 5 most valuable customers?
-- This query calculates the total spending for each customer and identifies the top 5.

SELECT
    c.CompanyName,
    c.ContactName,
    ROUND(SUM(od.UnitPrice * od.Quantity)::numeric, 2) AS TotalSpent
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
GROUP BY
    c.CompanyName,
    c.ContactName
ORDER BY
    TotalSpent DESC
LIMIT 5;