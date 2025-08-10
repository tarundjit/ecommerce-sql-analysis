-- Query 2: Top 5 Sales Representatives by Revenue
SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_sales
FROM
    employees e
JOIN
    orders o ON e.employee_id = o.employee_id
JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY
    employee_name
ORDER BY
    total_sales DESC
LIMIT 5;