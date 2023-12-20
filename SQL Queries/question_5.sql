-- Which product category generated the most profit for the 'Wiltshire, UK' region in 2021?
SELECT * FROM dim_product;

SELECT * FROM dim_store;

SELECT 
    category,
    SUM((dim_product.sale_price - dim_product.cost_price) * product_quantity) AS profit
FROM orders
JOIN dim_product ON orders.product_code = dim_product.product_code
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_date ON orders.order_date = dim_date.date
WHERE (country_region = 'Wiltshire' AND country = 'UK' AND year = 2021)
GROUP BY category
ORDER BY profit DESC;

-- Homeware generated the most profit for 'Wiltshire, UK in 2021.