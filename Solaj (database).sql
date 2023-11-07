use e_commerce_store;

## creating customer table
create table customer(
	CustomerId int primary key not null,
	CustomerName varchar(255) default null,
    ContactName varchar(255) default null,
    Address varchar(255) default null,
    City varchar(255) default null,
    PostalCode varchar(255) default null,
    Country varchar(255) default null
);
## data for customer table was imported

## creating employees table
create table employees(
	EmployeeID int primary key not null,
    LastName varchar(255) default null,
    FirstName varchar(255) default null,
    BirthDate date default null,
    Photo varchar(255) default null,
    Notes text
);
## data for employees table was imported

## creating suppliers table
create table suppliers(
	SupplierID int primary key not null,
    SupplierName varchar (255) default null,
    ContactName varchar (255) default null,
    Address varchar (255) default null,
    City varchar (255) default null,
    PostalCode varchar (255) default null,
    Country varchar (255) default null,
    Phone varchar (255) default null
);
## data for suppliers table was imported

## creating categories table
create table categories(
	CategoryID int primary key not null,
    CategoryName varchar (255) default null,
    Description varchar (255) default null
);
## data for categories table was imported

## creating shippers table
create table Shippers(
	ShipperID int primary key not null,
    ShipperName varchar (255) default null,
    Phone varchar (255) default null
);
## data for shippers table was imported

## creating orders table
create table orders(
	OrderID int primary key not null ,
    CustomerID int default null,
    EmployeeID int default null,
    OrderDate DATE default null,
    ShipperID int default null,
    
    constraint foreign key (Customerid) references Customer (Customerid),
    constraint foreign key (EmployeeID) references employees (EmployeeID),
    constraint foreign key (ShipperID) references Shippers (ShipperID)
);
## data for orders table was imported

## creating products table
create table products(
	ProductID int primary key not null,
    ProductName varchar (255) default null,
    SupplierID int default null,
    CategoryID int default null,
    Unit varchar (255) default null,
    Price double default null,
    
	constraint foreign key (SupplierID) references Suppliers (SupplierID),
    constraint foreign key (CategoryID) references Categories (CategoryID)
);
## data for products table was imported

## creating order_details table
create table Order_Details(
	OrderDetailID int primary key not null,
    OrderID int default null,
    ProductID int default null,
    Quantity int default null,
    
    constraint foreign key (OrderID) references Orders (OrderID),
    constraint foreign key (ProductID) references Products (ProductID)
);
## data for order_details table was imported

