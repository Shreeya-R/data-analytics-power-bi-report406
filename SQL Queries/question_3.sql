-- Which German store type had the highest revenue for 2022?
SELECT * FROM dim_store;

SELECT * FROM dim_date;

SELECT * FROM orders;

SELECT
    country,
    store_type,
    SUM(orders.product_quantity * dim_product.sale_price) AS total_revenue
FROM orders
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE (year = 2022 AND country = 'Germany')
GROUP BY country, store_type
ORDER BY total_revenue DESC;

-- The store type with the highest revenue in 2022 in Germany was 'Local'.