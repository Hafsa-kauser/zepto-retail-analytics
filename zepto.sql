SELECT * FROM zepto_v1 LIMIT 10;
SELECT COUNT(*) 
FROM zepto_v1 
WHERE outOfStock = 'TRUE';

-- Average discount
SELECT AVG(discountPercent) 
FROM zepto_v1;

-- Top 10 expensive products
SELECT name, mrp 
FROM zepto_v1 
ORDER BY mrp DESC 
LIMIT 10;

-- lowest stock 
SELECT Category, SUM(quantity) AS total_quantity
FROM zepto_v1
GROUP BY Category
ORDER BY total_quantity ASC;

-- avg mrp
SELECT Category, AVG(mrp) AS avg_mrp
FROM zepto_v1
GROUP BY Category
ORDER BY avg_mrp DESC;

-- highest discount
SELECT name, discountPercent
FROM zepto_v1
ORDER BY discountPercent DESC
LIMIT 10;

-- Rank products by price (window function)
SELECT 
  name,
  mrp,
  RANK() OVER (ORDER BY mrp DESC) AS price_rank
FROM zepto_v1;

-- Low Inventory Risk
SELECT name, category, availableQuantity
FROM zepto_products
ORDER BY availableQuantity ASC
LIMIT 20;

-- Price vs MRP Difference
SELECT name, mrp, discountedSellingPrice,
(mrp - discountedSellingPrice) AS price_drop
FROM zepto_products
ORDER BY price_drop DESC;
