## --------------------------------------- SECTION B Exploratory Data Analysis ----------------------------------- ##

-- 1. Total number of products sold so far
SELECT count(ProductID)
from products;

-- 2. Total Revenue So far.
SELECT sum(price*Quantity) as "Total Revenue"
FROM order_details as od
inner join products as p on p. ProductID = od.ProductID;

-- 3. Total Unique Products sold based on category
select distinct ProductName, od.productID, CategoryName
from categories as c
inner join products as p on p.CategoryID = c.CategoryID
inner join order_details as od on od.ProductID = p.ProductID;

-- 4. Total Number of Purchase Transactions from customers
select count(OrderID) as "Total Number of Purchase"
from orders;

-- 5. Compare Orders made between 2021 – 2022
select Year(OrderDate), count(OrderID)
from Orders
group by(Year(OrderDate));

-- 6. What is total number of customers? Compare those that have made transaction and those that haven’t at all.
select count(CustomerID) as "total number of customers"  
from customers;

select count(c.CustomerID) as "Customers that haven't purchased"
from customer as c
left join orders as o on c.CustomerID = o.CustomerID
where orderID is null
group by OrderID;

select count(c.CustomerID) as "Customers that purchased"
from customer as c
left join orders as o on c.CustomerID = o.CustomerID
where orderID is not null;

-- 7. Who are the Top 5 customers with the highest purchase value
select count(c.CustomerID), CustomerName, sum(Price) as "total amount"
from customer as c
inner join orders as o on o.CustomerID = c.CustomerID
inner join order_details as od on od.OrderID= o.OrderID
inner join products as p on p.ProductID = od.ProductID
group by c.CustomerID
order by sum(price) desc
limit 5;

-- 8. Top 5 best-selling products
select (productID), sum(quantity)
from Order_details
group by productID
order by sum(quantity) desc
limit 5;

-- 9. What is the Transaction value per month
select concat(month(OrderDate), "-", year(OrderDate)) as "Month-Year" ,count(o.OrderID) as "No of Orders", sum(price) as "Total Amount"
from Orders as o
inner join order_details as od on o.OrderID = od.OrderID
inner join products as p on p.ProductID = od.ProductID
group by concat(month(OrderDate), "-", year(OrderDate));

-- 10. Best Selling Product Category?
select c.CategoryID, CategoryName, count(OrderID) as "Number of Orders"
from categories as c
inner join Products as p on p.CategoryID = c. CategoryID
inner join order_details as od on od.ProductID = p.ProductID
group by CategoryID
order by count(OrderID) desc;

-- 11. Buyers who have Transacted more than two times
Select CustomerID, count(OrderID)
from orders
group by (CustomerID)
having count(OrderID) > 2;

-- 12. Most Successful Employee.
select count(OrderID) as "No of Orders", e.EmployeeID
from employees as e
inner join orders as o on o.EmployeeID = e.EmployeeID
group by e.EmployeeID
order by count(OrderID) desc
limit 1;

-- 13. . Most used Shipper
Select s.ShipperId, ShipperName, count(OrderID) as "No of Orders"
from shippers as s
inner join orders as o on o.ShipperID = s.ShipperID
group by ShipperID 
order by count(OrderID) desc
limit 1;

-- 14. Most used Supplier.
Select s.supplierID, SupplierName, count(o.OrderID) as "No Of Orders"
from Suppliers as s
inner join Products as p on p.SupplierID = s.SupplierID
inner join order_details as od on od.ProductID = p.productID
inner join orders as o on o.OrderID = od.OrderID
group by s.supplierID
order by count(o.OrderID) desc
limit 1;

