-- Create a view where the rows are the store types and the columns are the total sales and count of orders.
SELECT * FROM dim_store;

SELECT * FROM orders;

SELECT * FROM dim_customer;

SELECT 
    store_type,
    SUM(product_quantity * dim_product.sale_price) AS sales,
    COUNT(order_date_uuid) AS count_of_orders
FROM orders
JOIN dim_store ON orders.store_code = dim_store.store_code
JOIN dim_product ON orders.product_code = dim_product.product_code
GROUP BY store_type
ORDER BY sales DESC;

-- percentage total sales = (sales/SUM(sales)) AS percentage_sales