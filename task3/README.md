# 🛒 Supermarket Sales Data Analysis & Cleaning (DEPI - Task 3)

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-150458?logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange?logo=jupyter&logoColor=white)](https://jupyter.org/)
[![DEPI](https://img.shields.io/badge/Program-DEPI-green)](#acknowledgments)

This repository contains the solution for **Task 3** of the **Digital Egypt Pioneers Initiative (DEPI)** track. It focuses on end-to-end data auditing, cleaning, preprocessing, and Exploratory Data Analysis (EDA) on a retail supermarket dataset using **Python** and **Pandas**.

---

## 📋 Table of Contents
- [Project Overview](#-project-overview)
- [Repository Structure](#-repository-structure)
- [Dataset Overview](#-dataset-overview)
- [Data Cleaning Pipeline](#-data-cleaning-pipeline)
- [Key Insights & Business Findings](#-key-insights--business-findings)
- [Getting Started](#-getting-started)
- [Dependencies](#-dependencies)
- [Acknowledgments](#-acknowledgments)

---

## 🎯 Project Overview

Real-world datasets frequently contain inconsistencies, missing values, duplicates, and unformatted fields. The goal of this task is to take a raw supermarket sales dataset (`SuperMarket.csv`) and:
1. Conduct an initial exploratory audit.
2. Clean, standardize, and format all dirty attributes.
3. Engineer new temporal attributes.
4. Answer core business performance questions (revenue, profitability, payment methods, customer segments).

---

## 📁 Repository Structure

```text
task3/
│
├── 2.ipynb            # Main Jupyter Notebook containing the cleaning pipeline & EDA
├── 1.py               # Auxiliary notebook / script file
├── SuperMarket.csv    # Raw Supermarket transactions dataset (1,014 records)
└── README.md          # Task documentation
```

---

## 📊 Dataset Overview

- **Source File:** `SuperMarket.csv`
- **Initial Shape:** 1,014 rows × 17 columns
- **Final Cleaned Shape:** 1,000 rows × 19 columns
- **Key Columns:** `Invoice ID`, `Branch`, `City`, `Customer type`, `Gender`, `Product line`, `Unit price`, `Quantity`, `Tax 5%`, `Sales`, `Date`, `Time`, `Payment`, `cogs`, `gross margin percentage`, `gross income`, `Rating`.

---

## 🧹 Data Cleaning Pipeline

The preprocessing workflow implemented in [`2.ipynb`](2.ipynb) includes:

1. **Standardizing Column Names:**
   - Stripped trailing/leading spaces, converted to lowercase, converted `%` to `percent`, replaced special characters with underscores, resulting in clean `snake_case` headers (e.g., `tax_5percent`, `gross_margin_percentage`).
2. **String Standardization:**
   - Stripped leading/trailing whitespace across all text columns.
   - Normalized payment types: unified `E-wallet` / `Ewallet`, `credit card` / `Credit card`, and `cash` / `Cash`.
3. **Data Type Casting:**
   - Stripped `"EGP"` currency indicators from `sales` and converted to numeric (`Float64`).
   - Parsed `date` column into `datetime64[ns]` format.
4. **Handling Missing Values:**
   - Imputed missing numeric values in `unit_price` (24 missing) and `sales` (20 missing) with their respective **median values**.
   - Imputed missing dates (12 missing) using forward-fill and backward-fill (`ffill().bfill()`).
5. **Handling Duplicates:**
   - Identified and eliminated **14 duplicate records**, ensuring high data integrity.
6. **Feature Engineering & Dimensionality Reduction:**
   - Extracted temporal features: `day`, `month`, and `year`.
   - Dropped identifier column (`invoice_id`).
   - Chronologically sorted transactions by `date` and `time`.

---

## 📈 Key Insights & Business Findings

| Metric | Result / Finding |
| :--- | :--- |
| **Total Revenue** | **319,443.63 EGP** |
| **Average Transaction Value** | **~319.44 EGP** |
| **Top City by Revenue** | **Naypyitaw** (109,107.34 EGP), followed by Mandalay (105,602.90 EGP) and Yangon (104,733.39 EGP) |
| **Most Profitable Branch** | **Giza** (Gross income: ~5,265.18 EGP) |
| **Best-Selling Product Line** | **Food and beverages** (Revenue: 55,558.23 EGP \| Profit: 2,673.56 EGP) |
| **Customer Contribution** | **Members** spend significantly more (186,171.65 EGP) than **Normal** customers (133,271.99 EGP) |
| **Preferred Payment Method** | **Ewallet** (345 transactions), closely followed by Cash (344) and Credit Card (311) |
| **Highest Sales Day** | **Day 27** of the month (18,482.76 EGP) |
| **Highest Sales Month** | **January** (Month 1: 117,967.65 EGP) |

---

## 🚀 Getting Started

### Prerequisites
Make sure you have Python 3.8+ installed along with Jupyter Notebook or JupyterLab.

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/moaaz-z/DEPI.git
   cd DEPI/task3
   ```

2. Create and activate a virtual environment (optional but recommended):
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # Linux / macOS
   python3 -m venv venv
   source venv/bin/activate
   ```

3. Install required packages:
   ```bash
   pip install pandas jupyter
   ```

4. Launch Jupyter Notebook to view and run the analysis:
   ```bash
   jupyter notebook 2.ipynb
   ```

---

## 🛠️ Dependencies

- **[Python](https://www.python.org/)** (>= 3.8)
- **[Pandas](https://pandas.pydata.org/)** — Data manipulation and analysis
- **[Jupyter Notebook / IPython](https://jupyter.org/)** — Interactive computing environment

---

## 👥 Acknowledgments

Developed as part of the **Digital Egypt Pioneers Initiative (DEPI)** track submissions.
