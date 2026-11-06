# Task 3: Advanced T-SQL Functions, Procedures & Triggers

[![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-T--SQL-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![DEPI](https://img.shields.io/badge/Program-DEPI-green)](#acknowledgments)

Advanced database programmability solutions for **Task 3 (SQL)** of the **DEPI** Data Engineering curriculum. Implements string and date transformations, ranking window functions, User-Defined Functions (UDFs), parameterized stored procedures with business validations, and transactional rollback triggers on a financial/banking schema.

---

## Database Context

The scripts operate on a banking domain schema encompassing:
- `Customer`: Customer demographics, contacts, and addresses.
- `Account`: Bank account numbers, customer mappings, and current balances.
- `Transactions`: Transaction records (`Deposit`, `Withdrawal`, amount, date).
- `Loans`: Customer loan facilities and terms.

---

## Highlights of Implemented Solutions

The script [`task3.sql`](task3.sql) solves 13 practical database engineering problems:

1. **String & Date Transformations (Q1–Q5):**
 - Case formatting (`UPPER`, `LOWER`) and substring truncation (`LEFT(name, LEN(name)-2)`).
 - Missing data handling with `ISNULL(email, 'No Email Provided')`.
 - Date decomposition using `DATENAME(month, ...)` and `DATENAME(year, ...)`.
 - Pattern substitution with `REPLACE(address, 'Cairo', 'Cairo City')`.
2. **Ranking & Numerical Operations (Q6–Q7):**
 - CTE with `RANK() OVER (ORDER BY balance DESC)` to isolate the top 3 highest-balance accounts.
 - Nearest-thousand rounding (`ROUND(loanamount, -3)`) and currency formatting (`'$' + CAST(...)`).
3. **User-Defined Functions (UDFs) (Q8–Q11):**
 - **Scalar Function (`dbo.getmonth`):** Accepts a datetime parameter and returns the full month name string.
 - **Multi-Statement Table-Valued Function (`dbo.getaccountsbybalance`):** Filters and returns account IDs within a defined min/max balance range.
 - **Inline Table-Valued Function (`dbo.getcustomeraccounts`):** Returns high-performance tabular customer account details and balances.
 - **Validation Function (`dbo.checkcustomername`):** Evaluates whether a customer record has a populated name.
4. **Stored Procedures with Logic (Q12):**
 - `dbo.insertcustomer`: Validates uniqueness of phone numbers before inserting new customer records, preventing duplicate entries and outputting informative status messages.
5. **Transactional Business Rules & Triggers (Q13):**
 - `dbo.trg_updatebalance`: An `AFTER INSERT` trigger on `Transactions` that automatically calculates new balances based on transaction type (`Deposit` vs `Withdrawal`).
 - **Overdraft Protection:** Automatically executes `ROLLBACK TRANSACTION` if any resulting account balance falls below zero.

---

## File Structure

```text
task3-SQL/
├── task3.sql # Complete T-SQL script containing all 13 questions and implementations
└── README.md # Task documentation
```

---

## Execution

Run the script in **SQL Server Management Studio (SSMS)** or **Azure Data Studio** against your banking database:

```sql
-- Example: Execute stored procedure
EXEC dbo.insertcustomer
    @name = 'Moaaz',
    @dateofbirth = '2006-01-19',
    @gender = 'Male',
    @address = 'Alexandria',
    @phonenum = '01012345678',
    @email = 'moaaz@test.com';

-- Example: Test inline function
SELECT * FROM dbo.getcustomeraccounts(1);
```
