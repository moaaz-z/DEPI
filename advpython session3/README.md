# Advanced Python Session 3: Web Scraping Fundamentals

[![Python](https://img.shields.io/badge/Python-3.10%2B-blue?logo=python&logoColor=white)](https://www.python.org/)
[![Selenium](https://img.shields.io/badge/Selenium-Automation-43B02A?logo=selenium&logoColor=white)](https://www.selenium.dev/)
[![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange?logo=jupyter&logoColor=white)](https://jupyter.org/)

Practical introductory session covering dynamic browser automation and web scraping fundamentals using **Python** and **Selenium WebDriver**.

---

## Topics Covered

- **WebDriver Initialization:** Setting up and configuring Chrome WebDriver.
- **Browser Life Cycle:** Navigating to URLs, window maximization, timeouts, and safe browser termination (`driver.quit()`).
- **DOM Inspection & URL Verification:** Reading runtime browser metadata (such as `driver.current_url` and page titles).
- **Element Locators:** Practical examples locating search bars and interactive elements using `By.ID` and `By.NAME` on platforms such as W3Schools and Wikipedia.

---

## Folder Contents

```text
advpython session3/
├── webscraping.ipynb # Interactive Jupyter notebook with Selenium exercises
└── README.md # Session documentation
```

---

## How to Run

1. Install Selenium:
 ```bash
 pip install selenium
 ```
2. Ensure Google Chrome is installed on your machine.
3. Open [`webscraping.ipynb`](webscraping.ipynb) and run the cells sequentially.
