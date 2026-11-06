# Naukrigulf Job Scraping Pipeline (Task 1)

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Selenium](https://img.shields.io/badge/Selenium-WebDriver-43B02A?logo=selenium&logoColor=white)](https://www.selenium.dev/)
[![Pandas](https://img.shields.io/badge/Pandas-Data%20Extraction-150458?logo=pandas&logoColor=white)](https://pandas.pydata.org/)

An automated web scraping pipeline built with **Selenium WebDriver** and **Pandas** to extract **Data Engineer** job opportunities in Egypt from the [Naukrigulf](https://www.naukrigulf.com) job portal.

---

## Objective

Automate the discovery and extraction of job market data for Data Engineering roles, capturing key recruitment metrics:
- Job Title
- Hiring Company
- Work Location
- Years of Experience Required
- Comprehensive Job Description
- Direct Application URL

The scraped records are parsed, deduplicated, and exported to structured CSV format (`naukrigulf_jobs.csv`) for market research and trend analysis.

---

## Repository Structure

```text
Task 1 - Flask & Selenium/
├── Naukrigulf.ipynb # Main Selenium automation script and extraction notebook
├── naukrigulf_jobs.csv # Extracted job listings dataset
└── README.md # Documentation
```

---

## Features & Automation Steps

1. **Anti-Detection Browser Configuration:**
 - Chrome automation flags suppressed (`--disable-blink-features=AutomationControlled`, `excludeSwitches: ["enable-automation"]`).
 - Headless / optimized window size (`1920x1080`) to ensure dynamic DOM elements render consistently.
2. **Search Automation:**
 - Interacts with Naukrigulf search modal.
 - Types query `"Data Engineer"` and target country `"Egypt"`.
 - Submits query and handles AJAX response wait times.
3. **Link Extraction & Filtering:**
 - Filters CSS anchor selectors containing `jid-` identifiers to isolate verified job listings.
 - Eliminates duplicate hyperlinks.
4. **Detail Page Scraping:**
 - Visits each target posting sequentially.
 - Parses DOM trees to capture job title, company name, experience brackets, location tags, and text body.
5. **Data Export:**
 - Transposes collected dictionary entries into a Pandas DataFrame.
 - Saves to `naukrigulf_jobs.csv` using UTF-8-SIG encoding.

---

## How to Run

### Prerequisites
- Python 3.8+
- Google Chrome browser installed
- Compatible ChromeDriver (managed automatically by Selenium 4.x)

### Installation
```bash
pip install selenium pandas
```

### Execution
Run the cells in [`Naukrigulf.ipynb`](Naukrigulf.ipynb) using Jupyter Notebook or VS Code. The script will initialize Chrome, perform the search, extract records, and save `naukrigulf_jobs.csv`.
