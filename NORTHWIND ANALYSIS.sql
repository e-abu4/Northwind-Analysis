-- 1 Create a report that shows the categoryname and description from category

select CategoryName, description
from categories
order by CategoryName desc;

-- 2 create a report that shows the contactname, companyname, contacttitle and phone from customer
select contactname, companyname, contacttitle, phone from customers order by phone desc;

-- 3 create a report that shows the capitalized firstname and capitalized lastname rename as firstname and lastname
select upper(FirstName), upper(LastName), hiredate from employees order by HireDate desc;


-- 4 create a report that show the top10 orderid, orderdate, shippeddate, customerid, freight from order
select orderid, customerid, orderdate, shippeddate,freight 
from orders
 order by freight desc
 limit 10;
 
 -- 5 create a report that shows all customerid in lowercase and renamed as id from customer table
 select lower(customerid) as ID from customers;
 
-- 6 create a report that shows the companyname,fax,phone,country, homepage from the suppliers table sorted by the country in desc order then by companyname in asc order
select companyname, fax, phone,country, homepage from suppliers order by country desc, companyname asc;

-- 7 create a report that shows companyname,contactname of all customers from "Buenos Aires" only
select companyname, contactname from customers where city like "Buenos Aires";

-- 8 create a report that shows productname, unitprice, quantityperunit of product that are out of stock
select productname, unitprice, quantityperunit from products where UnitsInStock = 0;

-- 9 create a report showing all the contactname,address, city, of all customer not from germany, mexico and spain

select contactname, address, city 
from customers
where Country not in ("Germany" "Mexico" "Spain");

-- 10 create a report showing orderdate, shippeddate, customerid, freight of all order placed on 21 may1996
select orderdate, shippeddate, customerid, freight from orders
where orderdate like "1996-05-21 00:00:00";

-- 11 create a report showing firstname, lastname, country form the employee not from united state
select firstname, lastname, country from employees 
where country not like "USA";

-- 12 create a report that shows the employeeid,orderid, customerid,requireddate,shippeddate from all order shipped later than the require ddate
select EmployeeID, orderid, customerid, requireddate, shippeddate from orders
where RequiredDate < ShippedDate;

-- 13 create a report that shows the city, companyname, contactname of customers from cities starting with A and B
select city, companyname, contactname from customers
where city LIKE "A%"OR city like "B%";

-- 14 create a report showing all the even numbers of order id from order table
select * from orders where OrderID %2=0;

-- 15 create a reort that shows all the order where the freight cost more than $500
select * from orders
where Freight >= 500;

-- 16 create a report that shows product name, unitinstock, unitonorder, reorderlevel of all products that are up for reorder
select productname,unitsinstock,UnitsOnOrder,ReorderLevel from products
where ReorderLevel>1;

-- 17 create a report that shows companyname, contactname, fax of all customer that do not have fax number and sorted by contact name
select CompanyName,ContactName,Fax from customers
where fax is NULL
order by ContactName;

-- 18 create a report that shows the fristname, lastname of all employee that do not report to anybody

select firstname,lastname from employees
where ReportsTo is null;

-- 19 create a report showing all odd numbers of orderid from orders table
select * from orders
where OrderID %2<>0;

-- 20 create a report that shows the companyname, contactname,fax, of all customers from cities that has letter L in the name sored by contactname
select CompanyName,ContactName,Fax from customers
where city Like "%L%"
order by ContactName;

-- 21 create a report that shows the city, companyname, contactname of customers from cities that has letter L in the name sorted by contactname
select city,CompanyName,ContactName from customers
where city like "%L%"
order by ContactName;

-- 22 create a report that shows firstname, lastname,birth date of employee born in the 1950s
select firstname, lastname,birthdate from employees
where birthdate between "1950-01-01" and "1959-12-31";

-- 23 create a report that shows the firstname,lastname,the year of birth as birth year from employee table
select firstname, lastname,year(birthdate) as birthyear from employees;

-- 24 create a report showing orderid, total number of orderid as numberoforders from the irderdetails table groupby orderid and sorted by numberoforders in descending orde
select orderid,count(orderid) as numberoforders from `order details`
group by OrderID
order by numberoforders desc;

-- 25 create a report that shows the supplierid,productname,companyname form product supplied by exotic liquid,specialty biscuits,ltd.Escargots Nouveaus sorted by the supplierid
select p.supplierid,p.productname,s.CompanyName
from products as p
join suppliers as s on s.supplierid=p.supplierid
where s.companyname in ("Exotic liquids", "Specialty Biscuits, Ltd.", "Escargots Nouveaux")
order by p.SupplierID;

-- 26 create a report that shows the the shippostal code, orderid,orderdate, requireddate,shippeddate, shipaddress of all orders with shippostalcode beqinning with 98124
select shippostalcode,orderdate,orderid,requireddate,shippeddate,shipaddress from orders
where ShipPostalCode like "%98124";

-- 27 create a report that shows the contactname,contacttitle, companyname of customers that has no sales in their contacttitle
select * from customers;
select contactname,contacttitle,companyname from customers
where ContactTitle not like "sales%";

-- 28 Create a report that shows lastname,firstname, city of employee in cities other than "seattle"
select lastname,firstname,city from employees
where city not like "seattle";

-- 29 Create a report that shows companyname,contacttitle,city,country of all customer in any city in mexico or other cities in spain other than madrid
select * from customers;

select companyname,contacttitle, city,country 
from customers
where country in ("Mexico","Spain") and city <> "Madrid";

-- 30 create a select satatement that output the following
select * from customers;

-- 31 Create a report that shows the contact name of all customers that donot have letter A as the second alphabets in their contact name
select contactname from customers
Where ContactName like "_a%";

-- 32 Create a report that shows the average unit price round to the next whole number, total price in unitstock and maximum number of orders from the product all saved as average price,total stock and maxorder respectively
select round(avg(UnitPrice)) as Averageprice, sum(unitsinstock) as Totalstock, max(unitsonorder) as Maxorder
from products;

-- 33 Create a report that shows the suppliersid, companyname,categoryname,productname and unit price from products, suppliers and categories table.
select p.supplierid, c.categoryname, p.productname, p.unitprice, s.companyname
from products as p
join suppliers as s on s.supplierid =p.supplierid
join categories as c on c.CategoryID = p.categoryid;

-- 34 Create a report that shows the customerid, sumoffreight, from order table with sum of frieght greater $200, group by customerid
select customerid,sum(freight) as sumoffreight
from orders
group by CustomerID
having sum(Freight)>200;

-- 35 Create a report that shows the orderid,contactname,unitprice,quantity,discount from order details, orders and customer table with discount given on every purchase
select o.orderid, c.contactname, od.unitprice, od.quantity, od.discount
from `order details` as od
join orders as o on o.orderid= od.orderid
join customers as c on c.customerid=o.customerid
where discount>0;

-- 36 Create a report that shows the employeeid, the lastname and firstname as employee and the lastname and firstname of who they report to as manager from the employee table sorted by the employee  

select e.Employeeid,concat(e.firstname," " ,e.lastname) as employee , concat(m.firstname," " ,m.lastname) as Manager
from employees as e 
left join employees m on m.EmployeeID=e.ReportsTo;

-- 37 Create a report that shows the average, minimum and maximum unit price of all product as average price, minimum price and maximum price respectively
select avg(unitprice) as Averageprice, min(unitprice) as Minimumprice, Max(unitprice) as MaximumPrice
from `order details`;

-- 38 Create a view named customer infor that shows the customerid companyname, contactname,contacttitle, address, city,country, phone, orderdate, requireddate, shippeddate, from the customers and order table
create view Customerinfo as
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, c.phone, o.OrderDate,o.requireddate, o.shippeddate
from customers as c
join orders as o on c.customerid=o.customerid;

-- 39 Change the name of the view you created from customerinfor to customers details
create or replace view customerinfo as 
select c.customerid, c.companyname, c.contactname, c.contacttitle, c.address, c.city, c.country, c.phone, o.OrderDate,o.requireddate, o.shippeddate
from customers as c
join orders as o on c.customerid=o.customerid;

-- 40 Create a view named products details that shows the productid,companyname,productname,categoryname,description,quantityperunit,unitprice,unitinstock,unitonorder,recorderlevel,discontinued from supplier from product and categories table

create view productdetails as
select p.productid, s.companyname, p.productname, c.categoryname, c.description, p.quantityperunit, p.unitprice, p.unitsinstock,p.unitsonorder, p.reorderlevel,p.discontinued
from products as p
join suppliers as s on s.SupplierID=p.SupplierID
join categories as c on c.CategoryID=p.CategoryID;

-- 41 Drop the customerdetail view
drop  view customerdetails;

-- 42 Create a report that fetch the first five characters of categoryname from the categories table and renamed as shortinfor
select substring(categoryname ,1,5) as Shortinfo
from categories;


-- 43 Create a copy of shipper table as shippers duplicate.then insert a copy of shippers data into a new table
create table shipper_duplicate
select shipperid,companyname,phone from shippers,

-- 44 create a select statement that outputs the following from shipperduplicate table
select shipperid,companyname,phone from shipper_duplicate;

-- 45 Create a report that shows the companyname and productname from all product in the seafood category
select s.companyname, p.productname, c.categoryname
from products as p
join suppliers as s on s.SupplierID=p.SupplierID
join categories as c on p.categoryid=c.categoryid
where CategoryName like "seafood";

-- 46 create a report that shows the categoryid,companyname and productname from all product in the categoryid 5
Select * from categories;
select c.categoryid,s.companyname,p.productname
from products as p
join suppliers as s on s.SupplierID=p.supplierid
join categories as c on p.CategoryID=c.CategoryID;

-- 47 delete the shipper_duplicate table
drop table shipper_duplicate;

-- 48 create a select statement that outputs the following from the employee table
select lastname, FirstName,title, (year(current_date)-year(birthdate)) as age
from employees;


-- 49 create a report that the companyname and total number of orders by customer renamed as number of orders since december 31, 1994. show number of orders greater than 10
select c.companyname,  count(o.orderid) as numberoforder
from customers as c
join orders as o on c.CustomerID=o.CustomerID
where OrderDate >= "1994-12-31 00:00:00"
group by c.CustomerID,c.CompanyName
order by count(o.OrderID) <=10;

-- 50 create a select statement that outputs the following from the table
select  concat(productname,QuantityPerUnit,unitprice) as productinfo
from products;

