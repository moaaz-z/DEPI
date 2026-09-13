
--Question 1:

select name ,
upper(name) as upper_name,
lower(name) as lower_name
from customer;

--Question 2:

select name,
left(name, len(name)-2) as modified_name 
from customer;

--Question 3:

select 
isnull(email, 'No Email Provided') as email_status
from customer;

--Question 4:

select datename(month,transactiondate) as month,
datename(year,transactiondate) as year
from transactions;

--Question 5:
select replace(address,'Cairo','Cairo City') as modified_address
from customer;

--Question 6:

with ranked_accounts as
(
    select
        name,
        balance,
        rank() over (order by balance desc) as balance_rank
    from customer
    left join account as a
        on customer.customerid = a.customerid
)

select *
from ranked_accounts
where balance_rank <= 3;

 --Question 7:

select loanamount,
round(loanamount, -3) as rounded_loanamount,
balance,
'$' + cast(balance as varchar(20)) as formatted_balance
from loans
left join customer as c
    on loans.customerid = c.customerid
left join account as a
    on c.customerid = a.customerid;    

--Question 8:

create function dbo.getmonth(@trancsactiondate datetime)
returns varchar(20)
as 
begin
    declare @month varchar(20);
    set @month = datename(month, @trancsactiondate);
    return @month;
end;
select
    TransactionDate,
    dbo.getmonth(TransactionDate) as month_name
from Transactions;

--Question 9:

create function dbo.getaccountsbybalance
(
    @minbalance int,
    @maxbalance int
)
returns @result table
(
    accountid int
)
as
begin

    insert into @result
    select accountid
    from account
    where balance between @minbalance and @maxbalance;

    return;

end;

select *
from dbo.getaccountsbybalance(1000, 10000);

--Question 10:

create function dbo.getcustomeraccounts
(
    @customerid int
)
returns table
as
return
(
    select
        c.name,
        a.accountid,
        a.balance
    from customer c
    inner join account a
        on c.customerid = a.customerid
    where c.customerid = @customerid
);

select *
from dbo.getcustomeraccounts(1);

--Question 11:

create function dbo.checkcustomername
(
    @customerid int
)
returns varchar(50)
as
begin

    declare @name varchar(100);
    declare @message varchar(50);

    select @name = name
    from customer
    where customerid = @customerid;

    if @name is null
        set @message = 'Customer name is null';
    else
        set @message = 'Customer name is not null';

    return @message;

end;

select dbo.checkcustomername(1);

--Question 12:
create procedure dbo.insertcustomer
    @name varchar(100),
    @dateofbirth date,
    @gender varchar(20),
    @address varchar(200),
    @phonenum varchar(20),
    @email varchar(100)
as
begin

    if exists
    (
        select 1
        from customer
        where phonenum = @phonenum
    )
    begin
        print 'Phone number already exists';
        return;
    end;

    insert into customer
    (
        name,
        dateofbirth,
        gender,
        address,
        phonenum,
        email
    )
    values
    (
        @name,
        @dateofbirth,
        @gender,
        @address,
        @phonenum,
        @email
    );

    print 'Customer inserted successfully';

end;

exec dbo.insertcustomer
    @name = 'Moaaz',
    @dateofbirth = '2006-01-19',
    @gender = 'Male',
    @address = 'Alexandria',
    @phonenum = '01012345678',
    @email = 'moaaz@test.com';

--Question 13:
create trigger dbo.trg_updatebalance
on transactions
after insert
as
begin

    update a
    set a.balance =
        a.balance +
        case
            when i.transactiontype = 'Deposit'
                then i.amount
            when i.transactiontype = 'Withdrawal'
                then -i.amount
            else 0
        end
    from account a
    inner join inserted i
        on a.accountid = i.accountid;

    if exists
    (
        select 1
        from account a
        inner join inserted i
            on a.accountid = i.accountid
        where a.balance < 0
    )
    begin
        print 'Insufficient balance';
        rollback transaction;
    end;

end;