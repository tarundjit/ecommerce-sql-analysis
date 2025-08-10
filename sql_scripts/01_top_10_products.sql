-- Query 1: What are our top 10 best-selling products?
-- Query 1a: Top 10 Products by TOTAL REVENUE
SELECT
    p.product_name,
    ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount))::numeric, 2) AS total_revenue
FROM
    products p
JOIN
    order_details od ON p.product_id = od.product_id
GROUP BY
    p.product_name
ORDER BY
    total_revenue DESC
LIMIT 10;

-- Query 1b: Top 10 Products by TOTAL QUANTITY SOLD
SELECT
    p.product_name,
    SUM(od.quantity) AS total_quantity_sold
FROM
    products p
JOIN
    order_details od ON p.product_id = od.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC
LIMIT 10;