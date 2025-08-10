-- Query 4: Top 5 most valuable customers by total spending
SELECT
    c.company_name,
    c.contact_name,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY
    c.company_name,
    c.contact_name
ORDER BY
    total_spent DESC
LIMIT 5;