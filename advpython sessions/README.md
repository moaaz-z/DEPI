# ⚡ Flask & SQL Server Web Application

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-Web%20Framework-black?logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![SQL Server](https://img.shields.io/badge/Microsoft%20SQL%20Server-Database-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![pyodbc](https://img.shields.io/badge/pyodbc-ODBC%20Bridge-blue)](https://github.com/mkleehammer/pyodbc)

A full-stack data-driven web application built with **Flask**, **Pandas**, and **Microsoft SQL Server (via pyodbc)** that demonstrates database-backed web services and dynamic reporting.

---

## 🎯 Architecture & Features

```mermaid
flowchart LR
    Client["Web Browser<br/>(HTML5 / CSS3)"] -->|HTTP GET / POST| Flask["Flask Web Server"]
    Flask -->|Execute Stored Procedure| DB[("SQL Server<br/>(BankSystem DB)")]
    DB -->|Result Set| Flask
    Flask -->|Pandas HTML Table Rendering| Client
```

- **Database Connectivity:** Configured secure connection string to Microsoft SQL Server using ODBC Driver 18 with encrypted transport.
- **Stored Procedure Execution:** Dynamically executes parameterized stored procedures (e.g., `execute p1 {customer_id}`) to retrieve real-time bank customer records.
- **Dynamic Table Generation:** Converts Pandas DataFrames directly into rendered HTML tables (`df.to_html()`).
- **Jinja2 Templating & Styling:** Modular templates (`index.html`, `project.html`, `cst.html`) structured with custom CSS stylesheets (`static/style.css`).

---

## 📁 Repository Structure

```text
advpython sessions/
├── 1.ipynb                # Development notebook containing Flask routes and DB connectors
├── static/
│   └── style.css          # Frontend styling rules
├── templates/
│   ├── index.html         # Homepage and customer lookup form
│   ├── project.html       # Project overview page
│   └── cst.html           # Customer report template
└── README.md              # Documentation
```

---

## 🚀 How to Run

### Prerequisites
- Python 3.8+
- Microsoft SQL Server with the `BankSystem` database and `p1` stored procedure configured
- ODBC Driver 18 for SQL Server

### Installation
```bash
pip install flask pyodbc pandas
```

### Launching the Application
Run the Flask server from [`1.ipynb`](1.ipynb) or export to a `.py` script:
```bash
python -m flask --app 1 run
```
Navigate to `http://127.0.0.1:5000` to interact with the customer lookup interface.
