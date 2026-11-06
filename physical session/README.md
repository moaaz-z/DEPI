# 🏢 In-Person Workshops: ETL Pipelines & Web Scraping

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Selenium](https://img.shields.io/badge/Selenium-Automation-43B02A?logo=selenium&logoColor=white)](https://www.selenium.dev/)
[![Pandas](https://img.shields.io/badge/Pandas-ETL-150458?logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![Requests](https://img.shields.io/badge/Requests-REST%20API-informational)](https://requests.readthedocs.io/)

Projects and practical labs completed during the **DEPI In-Person (Physical) Technical Sessions**, focusing on API-driven **ETL Pipelines** and advanced **Selenium Web Automation**.

---

## 📋 Projects Overview

### 1. 🌦️ Weather Data ETL Pipeline
- **Location:** `weather data project/etl.ipynb` (and `1.ipynb`)
- **Objective:** Extract live meteorological metrics across Egyptian governorates, apply transformations and regional classifications, and prepare data for analytical reporting.
- **Workflow:**
  - **Extract:** Calls REST API endpoints using `requests` for major Egyptian cities (Cairo, Giza, Alexandria, Port Said, Suez, Ismailia, Mansoura, etc.).
  - **Transform:** Normalizes JSON payload, parses temperature and atmospheric conditions, categorizes cities into geographic zones (e.g., Canal, Delta, Upper Egypt), and cleans missing points.
  - **Load:** Converts transformed metrics into structured Pandas DataFrames for downstream persistence.

---

### 2. 💼 Wuzzuf Job Market Scraper
- **Location:** `Wuzzuf Web Scraping Task/wuzzuf_webscrapping.ipynb` (and `2.ipynb`)
- **Objective:** Scrape dynamic tech and data job opportunities from the Egyptian hiring platform [Wuzzuf](https://wuzzuf.net/).
- **Features:**
  - Automated search execution and pagination handling.
  - Parsing job titles, company profiles, locations, operational modes (On-site / Hybrid / Remote), and required skills.
  - Exporting listings to [`wuzzuf_jobs.csv`](Wuzzuf%20Web%20Scraping%20Task/wuzzuf_jobs.csv).

---

### 3. 💬 Quotes To Scrape Automation
- **Location:** `Wuzzuf Web Scraping Task/QuotesWebscrapping.ipynb`
- **Objective:** Practical exercise automating browser navigation, quote text extraction, author parsing, and tag harvesting from `quotes.toscrape.com` using Selenium.

---

## 📁 Folder Structure

```text
physical session/
├── 1.ipynb                               # Weather ETL Pipeline notebook
├── 2.ipynb                               # Wuzzuf scraping task notebook
├── weather data project/
│   └── etl.ipynb                         # Modular weather extraction & transformation
├── Wuzzuf Web Scraping Task/
│   ├── QuotesWebscrapping.ipynb          # Quotes scraping exercise
│   ├── wuzzuf_webscrapping.ipynb         # Full Wuzzuf job extractor
│   └── wuzzuf_jobs.csv                   # Scraped jobs dataset
└── README.md                             # Section overview
```

---

## 🚀 How to Run

### Install Dependencies
```bash
pip install requests pandas selenium
```

### Run Notebooks
Open either the Weather ETL pipeline or the Wuzzuf scraping notebooks in Jupyter Notebook or VS Code to run the pipelines interactively.
