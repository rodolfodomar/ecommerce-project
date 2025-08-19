# Olist E-commerce & Sales Funnel Analytics Platform on GCP

## Project Overview

This project implements a complete Data Lakehouse architecture on Google Cloud Platform (GCP) to analyze e-commerce sales data and seller acquisition funnels from the public Olist dataset. The main goal is to build a reliable "single source of truth" that allows for comprehensive business intelligence analysis, from customer purchasing behavior to seller conversion rates.

This repository is part of a portfolio project demonstrating skills in data engineering, including ETL pipeline development, data modeling, process orchestration, and cloud infrastructure management.

**GCP Project ID:** `ecommerce-project-469319`

## Architecture

The architecture follows modern data engineering best practices, leveraging a Lakehouse model that combines the scalability of a Data Lake with the structured features of a Data Warehouse.

![Architecture Diagram](https://your-link-to-the-diagram.com/architecture.png)
*(**Action:** You should create this diagram using a tool like diagrams.net and upload it to your repository)*

1.  **Data Lake (Ingestion):** Raw CSV files are uploaded to a structured bucket in **Google Cloud Storage (GCS)**.
2.  **ETL & Transformation:** An ephemeral **Dataproc** cluster runs a **PySpark** job to clean, transform, join, and enrich the raw data. The processed data is then saved back to GCS in the optimized Parquet format.
3.  **Data Warehouse (Storage & Modeling):** **BigQuery** is used as the Data Warehouse. Data is loaded from the processed Parquet files and modeled into a Star Schema for e-commerce data and analytical tables for the sales funnel.
4.  **Orchestration:** **Cloud Composer (Airflow)** manages and automates the entire ETL pipeline, from file ingestion checks to loading data into BigQuery.
5.  **Business Intelligence:** **Power BI** connects directly to BigQuery to create interactive dashboards for business analysis.

## Datasets Used

* **Olist E-commerce Dataset:** Contains information about orders, products, customers, payments, and reviews.
* **Olist Sales Funnel Dataset:** Contains information about marketing qualified leads (MQLs) and closed deals with new sellers.

## Project Structure

This repository (`ecommerce-project`) is organized as follows:

├── dags/
│   └── olist_full_etl_dag.py     # Airflow DAG for orchestration
├── pyspark_scripts/
│   ├── process_ecommerce_data.py # Spark ETL for e-commerce data
│   └── process_funnel_data.py    # Spark ETL for sales funnel data
├── sql_models/
│   ├── create_dim_tables.sql     # DDL for dimension tables
│   └── create_fact_tables.sql    # DDL for fact tables
├── power_bi/
│   └── ecommerce_analysis.pbix   # Power BI project file
├── .gitignore
└── README.md

**Local Project Path:** `C:\Users\Rodolfo\OneDrive\projects\e-commerce`

## How to Reproduce this Project

### 1. Prerequisites
- Google Cloud Platform (GCP) Account
- Power BI Desktop
- Google Cloud SDK installed and configured
- Git

### 2. Setup GCP Environment
- Create a new GCP project named `ecommerce-project`.
- Enable the necessary APIs: Cloud Storage, Dataproc, BigQuery, Cloud Composer.
- Create a Service Account with the required roles (Storage Admin, Dataproc Editor, BigQuery Data Editor).
- Create a GCS bucket and the corresponding folder structure (`/raw`, `/processed`, etc.).
- Provision a Cloud Composer environment.
- Create two datasets in BigQuery (`ecommerce_staging` and `ecommerce_dw`).

### 3. Running the Pipeline
1.  **Upload Data:** Upload the raw Olist CSV files to the `gs://<your-bucket-name>/raw/` directory.
2.  **Upload Scripts:** Upload the PySpark scripts and the DAG file to their respective directories in your GCS bucket.
3.  **Trigger DAG:** Activate and trigger the `olist_full_etl_dag` from the Airflow UI.

### 4. Dashboards

*(**Action:** Insert high-quality screenshots of your final Power BI dashboards here)*

#### E-commerce Sales Analysis
![Sales Dashboard](https://your-link-to-the-screenshot.com/sales_dashboard.png)

#### Seller Acquisition Funnel
![Funnel Dashboard](https://your-link-to-the-screenshot.com/funnel_dashboard.png)
