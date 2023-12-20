-- Which month in 2022 has had the highest revenue?
SELECT * FROM dim_date;

SELECT * FROM orders;

SELECT * FROM dim_product;

SELECT
    month_name,
    SUM(product_quantity * sale_price) AS total_revenue
FROM orders
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE year = 2022
GROUP BY month_name
ORDER BY total_revenue DESC;

-- The month with the highest revenue for 2022 is August.