# 🎓 Task 2: Advanced SQL Queries & Views (School DB)

[![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-T--SQL-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![DEPI](https://img.shields.io/badge/Program-DEPI-green)](#acknowledgments)

Comprehensive solution set for **Task 2** of the **DEPI** Data Engineering curriculum, demonstrating advanced querying, data aggregation, multi-table joins, encrypted database views, Common Table Expressions (CTEs), and ranking window functions on a relational `School` schema.

---

## 🗄️ Database Context

The queries operate on an educational domain schema consisting of:
- `Student`: Student personal profiles and enrolled departments.
- `Instructor`: Faculty details, salaries, and department affiliations.
- `Department`: Academic departments and assigned department managers.
- `Course`: Academic courses mapped to conceptual topics.
- `Topic`: Higher-level subject classifications.
- `Stud_Course`: Association table tracking student enrollment and grades.

---

## 📋 Highlights of Implemented Solutions

The script [`task2-sql`](task2-sql) contains 20 structured queries addressing key analytical and architectural requirements:

1. **Aggregations & Missing Value Handling (Q1–Q5):**
   - Counts, distinct instructor names, and full name concatenations using `ISNULL()` fallback values for unassigned departments.
   - Filtered joins identifying students who have passed course exams (`sc.Grade IS NOT NULL`).
2. **Grouping & Analytical Summaries (Q6–Q13):**
   - Course volume counts grouped by topic classification.
   - Salary metrics (`MAX`, `MIN`, `AVG`) and subqueries identifying instructors earning below departmental averages.
   - Handling null salaries dynamically with `COALESCE(CAST(Salary AS VARCHAR(20)), 'Bonus')`.
   - Top departmental rankings by student enrollment using `TOP (3)` and `ORDER BY`.
3. **Database Views (Q14–Q17):**
   - `dbo.managertopics`: An **encrypted view** (`WITH ENCRYPTION`) traversing 5 related tables to map department managers directly to their managed course topics.
   - `dbo.instructors_sd_java`: Filtered view isolating faculty members in Software Development and Java departments.
   - `dbo.v1`: Regional view filtering students residing in Alexandria or Cairo.
   - `dbo.students_passed_courses`: Identifies students who completed courses with a grade exceeding 50.
4. **CTEs & Window Functions (Q18–Q20):**
   - **Departmental Peaks:** CTE computing student headcount per department, returning only the department with maximum enrollment.
   - **Second-Highest Earner:** Uses `DENSE_RANK() OVER (PARTITION BY Dept_Id ORDER BY Salary DESC)` to isolate the second-highest salary per department.
   - **Top-N Earners:** Uses `ROW_NUMBER() OVER (PARTITION BY Dept_Id ORDER BY Salary DESC, Ins_Id)` to return the top two highest-paid instructors for each department.

---

## 📁 File Structure

```text
task2-SQL/
├── task2-sql       # Complete SQL script containing 20 queries and view definitions
└── README.md       # Task documentation
```

---

## 🚀 Execution

Execute the script against the `School` database using **SQL Server Management Studio (SSMS)**, **Azure Data Studio**, or the `sqlcmd` command line utility:

```sql
USE School;
GO
```
