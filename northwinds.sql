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

    SELECT count(Id), strftime('%Y-%m', OrderDate) AS Month
    FROM 'Order'
    GROUP BY Month

-- 4. Get the top 3 products which have the most orders

    SELECT count(o.Id) as "Number of Orders", p.ProductName as "Product Name"
    FROM "Order" o
    JOIN OrderDetail od ON o.Id = od.OrderId
    JOIN Product p ON od.ProductId = p.Id
    GROUP BY p.ProductName
    ORDER BY "Number of Orders" desc LIMIT 3


-- 5. Get the list of the months which don’t have any orders for product chai ??
    
    SELECT count(o.Id), p.ProductName, strftime('%Y-%m', OrderDate) AS Month
    FROM 'Order' o
    JOIN OrderDetail od ON o.Id = od.OrderId
    JOIN Product p ON od.ProductId = p.Id
    where p.Productname != "Chai"
    GROUP BY Month

-- 6. Get the list of the products which don’t have any orders across all the months and year as

-- 7. Get the list of employees who processed orders for the product chai

    SELECT e.FirstName || " " || e.lastName as "Employee Name", p.ProductName 
    FROM Employee e
    JOIN "Order" o on o.EmployeeId = e.id
    JOIN OrderDetail od on od.orderid = o.id
    JOIN Product p on p.id = od.ProductId
    WHERE p.ProductName = "Chai"
    Group BY "Employee Name"

-- 8. Get the list of employees and the count of orders they processed in the month of march across all years

    SELECT e.FirstName || " " || e.lastName AS "Employee Name", count(o.id) AS "Number of Orders", strftime('%m', o.OrderDate) AS "Month"
    FROM Employee e
    JOIN "Order" o on o.EmployeeId = e.id
    WHERE "Month" LIKE '03'
    GROUP BY "Employee Name"

-- 9. Get the list of employees who processed the orders that belong to the city in which they live

    SELECT e.FirstName || " " || e.lastName AS "Employee Name", e.city AS "Employee City", o.ShipCity AS "Order City"
    FROM Employee e
    JOIN "Order" o on o.EmployeeId = e.id
    WHERE e.city = o.shipcity
    GROUP BY "Employee Name"

-- 10. Get the list of employees who processed the orders that don’t belong to the city in which they live

-- 11. Get the shipping companies that processed ordersfor the category Seafood

-- 12. Get the category name and count of orders processed by employees in the USA