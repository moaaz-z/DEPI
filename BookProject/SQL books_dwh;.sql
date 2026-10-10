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


