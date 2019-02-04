-- 1. Get a list of all the orders processed with category name (as an input parameter) *not implemented yet

	SELECT o.Id as "Order ID", c.CategoryName
	FROM "Order" o
	JOIN OrderDetail od ON o.Id = od.OrderId
	JOIN Product p ON od.ProductId = p.Id
	LEFT JOIN Category c ON p.CategoryId = c.Id
	WHERE c.CategoryName LIKE "Beverages"
    -- "Beverages" can be exchanged for any search parameter and all orderids with a category name of the parameter will be returned

-- 2. Get the product name , count of orders processed

    SELECT count(o.Id) as "Number of Orders", p.ProductName as "Product Name"
    FROM "Order" o
    JOIN OrderDetail od ON o.Id = od.OrderId
    JOIN Product p ON od.ProductId = p.Id
    GROUP BY p.ProductName

-- 3. Get the list of the months which don’t have any orders

-- 4. Get the top 3 products which have the most orders

-- 5. Get the list of the months which don’t have any orders for product chai

-- 6. Get the list of the products which don’t have any orders across all the months and year as

-- 7. Get the list of employees who processed orders for the product chai

-- 8. Get the list of employees and the count of orders they processed in the month of march across all years

-- 9. Get the list of employees who processed the orders that belong to the city in which they live

-- 10. Get the list of employees who processed the orders that don’t belong to the city in which they live

-- 11. Get the shipping companies that processed ordersfor the category Seafood

-- 12. Get the category name and count of orders processed by employees in the USA