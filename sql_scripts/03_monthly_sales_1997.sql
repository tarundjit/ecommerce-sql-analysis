-- Query 3: What was the monthly sales trend for the year 1997?
-- This query extracts the year and month from the order date to aggregate
-- sales totals for each month within 1997.

SELECT
    EXTRACT(MONTH FROM o.OrderDate) AS SalesMonth,
    ROUND(SUM(od.UnitPrice * od.Quantity)::numeric, 2) AS TotalSales
FROM
    Orders o
JOIN
    "Order Details" od ON o.OrderID = od.OrderID
WHERE
    EXTRACT(YEAR FROM o.OrderDate) = 1997
GROUP BY
    SalesMonth
ORDER BY
    SalesMonth;