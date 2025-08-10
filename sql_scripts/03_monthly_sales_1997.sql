-- Query 3: Monthly sales trend for the year 1997
SELECT
    EXTRACT(MONTH FROM o.order_date) AS sales_month,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_sales
FROM
    orders o
JOIN
    order_details od ON o.order_id = od.order_id
WHERE
    EXTRACT(YEAR FROM o.order_date) = 1997
GROUP BY
    sales_month
ORDER BY
    sales_month;