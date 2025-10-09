# 🏗️ PostgreSQL Data Warehouse Project

## 📋 Objective
Develop a **modern data warehouse** using **PostgreSQL** to consolidate and analyze **sales data**, enabling **analytical reporting** and **data-driven decision-making**.

---

## 🧱 Architecture Overview
The data warehouse follows the **Medallion Architecture**, consisting of three layers:

### 🥉 Bronze Layer – Raw Data
- Stores **raw data** exactly as ingested from source systems.  
- Data is imported from **CSV files** into the **PostgreSQL** database.  
- The objective is to ensure **traceability** and **debugging** capability.  
- Tables are created using a **full-load method** (*truncate and insert*).  
- No **data transformation** or **data modeling** is performed at this stage.  

### 🥈 Silver Layer – Cleansed Data
- Performs **data cleansing**, **standardization**, and **normalization**.
- Prepares consistent, high-quality datasets for analytical modeling.

### 🥇 Gold Layer – Business-Ready Data
- Contains **curated data** organized into a **Star Schema**.
- Includes **Fact** and **Dimension** tables optimized for **reporting and analytics**.

---

## ⚙️ Project Components

### 1. **Data Architecture**
Design of a **modern data warehouse** leveraging the Medallion Architecture (Bronze, Silver, Gold).

### 2. **ETL Pipelines**
Implementation of **ETL processes** to:
- **Extract** data from source CSV files.
- **Transform** and clean data in the Silver layer.
- **Load** the curated data into the Gold layer for reporting.

### 3. **Data Modeling**
- Development of **Fact** and **Dimension** tables following **Star Schema** principles.
- Optimization for **analytical queries** and **report performance**.

### 4. **Analytics & Reporting**
- Creation of **SQL-based reports** and **dashboards** to generate actionable insights.
- Supports key business questions related to **sales performance**, **customer behavior**, and **product trends**.

---

## 🧾 Specifications

- **Data Sources:** Import data from two source systems (**ERP** and **CRM**) provided as CSV files.  
- **Data Quality:** Cleanse and resolve data quality issues prior to analysis.  
- **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.  
- **Scope:** Focus on the **latest dataset only**; historization of data is not required.  
- **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.  
- **BI:** Designed to support **business intelligence** use cases through curated datasets and SQL-based reporting.

---

## 🧰 Tech Stack
- **Database:** PostgreSQL  
- **Data Sources:** CSV files  
- **ETL Tools:** SQL scripts / Python (if applicable)  
- **Modeling:** Star Schema  
- **Visualization:** SQL queries / BI tool (optional, e.g., Tableau, Power BI)  

---

## 📈 Expected Outcomes
- Centralized data repository enabling **consistent and reliable reporting**.  
- Improved **data quality**, **traceability**, and **accessibility**.  
- Enhanced **analytical capabilities** for better business decisions.  

---

## 🗂️ Folder Structure 
data_warehouse_project/
│
├── data/
│ ├── erp_data.csv
│ ├── crm_data.csv
│
├── scripts/
│ ├── etl_bronze.sql
│ ├── etl_silver.sql
│ ├── etl_gold.sql
│
├── tests/
│ ├── 
│ ├── 
│ ├── 
│
├── docs/
│ ├── 
│ ├── 
│
└── README.md

---

## 📘 Documentation
This project includes:
- **ERD (Entity Relationship Diagram)** showing data model relationships.  
- **Table definitions and metadata** for all key datasets.  
- **ETL process description** detailing transformation logic and dependencies.

---

## 🚀 Future Enhancements
- Automate ETL using **Airflow** or **dbt**.  
- Add **historization** for trend analysis over time.  
- Integrate with **BI tools** for visual dashboards.

---

## 🧑‍💻 Author
**Giorgia Testa**  
📧 giorgiatesta@outlook.com  
💼 [LinkedIn Profile](https://www.linkedin.com/in/giorgia-testa)