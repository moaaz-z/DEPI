create database books_dwh;
go

use books_dwh;
go

create schema bronze;
go

create schema silver;
go

create schema gold;
go


------Bronze Layer------
create table bronze.author_book(
    AuthorID varchar(50),
    BookID varchar(50)
)
create table bronze.author(
    AuthorID varchar(50),
    AuthorName varchar(50)
)
create table bronze.book_order(
    OrderID varchar(50),
    CustomerID varchar(50),
    OrderDate varchar(50)
)
create table bronze.book(
    BookID varchar(50),
    CategoryID varchar(50),
    Title varchar(50),
    ISBN varchar(50),
    Year varchar(50),
    Price varchar(50),
    NoPages varchar(50),
    BookDescription varchar(MAX)
)
create table bronze.category(   
    CategoryID varchar(50),
    CategoryDescription varchar(50)
)   
create table bronze.customer(
    CustomerID varchar(50),
    FirstName varchar(50),
    LastName varchar(50),
    ZipCode varchar(50),
    City varchar(50),
    State varchar(50)
)
create table bronze.ordering(
    OrderID varchar(50),
    BookID varchar(50),
    Price varchar(50),
    Quantity varchar(50)
)
------Silvewr Layer------
create table silver.author_book(
    AuthorID int,
    BookID int
)
create table silver.author(
    AuthorID int,
    AuthorName varchar(50)
)
create table silver.book_order(
    OrderID int,
    CustomerID varchar(50),
    OrderDate varchar(50)
)
create table silver.book(
    BookID int,
    CategoryID varchar(50),
    Title varchar(50),
    ISBN varchar(50),
    Year varchar(50),
    Price varchar(50),
    NoPages varchar(50),
    BookDescription varchar(MAX)
)
create table silver.category(   
    CategoryID varchar(50),
    CategoryDescription varchar(50)
)   
create table silver.customer(
    CustomerID int,
    FirstName varchar(50),
    LastName varchar(50),
    ZipCode varchar(50),
    City varchar(50),
    State varchar(50)
)
create table silver.ordering(
    OrderID int,
    BookID varchar(50),
    Price varchar(50),
    Quantity varchar(50)

)

------Gold Layer------
create table gold.dim_customer(
    customer_sk int identity(1,1) primary key,--surrogate key
    CustomerID int,
    FullName varchar(50),
    ZipCode varchar(50),
    City varchar(50),
    State varchar(50)

)
create table gold.dim_book(
    book_sk int identity(1,1) primary key,--surrogate key
    BookID int,
    CategoryID int,
    Title varchar(50),
    Year int,
    NoPages int,
    BookDescription varchar(MAX),
    AuthorName varchar(50) 
)

create table gold.fact_orders(
    order_sk int identity(1,1) primary key,--surrogate key
    Customer_sk int references gold.dim_book(book_sk),
    OrderID int,
    Book_sk int references gold.dim_book(book_sk),
    Price varchar(50),
    Quantity varchar(50),
    total_amount float,
    OrderDate date

)

select * from gold.dim_customer
select * from gold.dim_book


