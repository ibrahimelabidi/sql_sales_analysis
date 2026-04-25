--Top Products
SELECT 
	p.product_name,
	SUM(f.sales_amount) AS revenue 
FROM gold.fact_sales f
JOIN gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC;


--Top Customers
SELECT 
    c.customer_key,
    SUM(f.sales_amount) AS total_spent
FROM gold.fact_sales f
JOIN gold.dim_customers c
    ON f.customer_key = c.customer_key
GROUP BY c.customer_key
ORDER BY total_spent DESC; 


--High Value Products Having
SELECT 
    p.product_name,
    SUM(f.quantity) AS total_quantity
FROM gold.fact_sales f
JOIN gold.dim_products p
    ON f.product_key = p.product_key
GROUP BY p.product_name
HAVING SUM(f.quantity) > 100
ORDER BY total_quantity DESC;

--Monthly Sales
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales_amount) AS revenue
FROM gold.fact_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;