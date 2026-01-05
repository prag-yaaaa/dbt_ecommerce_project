📦 **E-commerce Data Engineering Pipeline**

This project demonstrates an end-to-end Data Engineering pipeline built to transform raw e-commerce data into analytics-ready datasets that support key business insights and reporting use cases.

🗄️ **Data Source**

Raw e-commerce data is stored in Snowflake and ingested from the following raw tables:

  - INVENTORY_DATA
  - PRODUCT_DATA
  - USER_DATA
  - USER_JOURNEY

The raw data includes nested and hierarchical fields, which are handled during transformation.

🎯 **Business Use Cases**

The pipeline is designed to address the following business requirements:

  - Search Effectiveness (Add-to-Cart Rate)
  - Product Performance Analysis
  - Marketing Campaign Effectiveness
  - Inventory Management & Stock Optimization

🏗️ **Data Modeling (dbt)**

All transformations and modeling are implemented using dbt following analytics engineering best practices.

⭐ **Dimensional Model**

The project produces five dimension tables and two fact tables:

_**Dimension Tables**_

  - dim_users_pg
  - dim_product_pg
  - dim_inventory_pg
  - dim_campaign_pg
  - dim_search_events_pg

**Fact Tables**__

  - fact_user_engagement_pg
  - fact_user_transaction_pg

🔄 **Advanced Transformations**

  - Flattening of hierarchical / nested JSON data (e.g., impressions and attribution fields) using Snowflake FLATTEN
  - Incremental models implemented to efficiently append only new or changed records
  - grain-consistent joins applied for scalable analytics

📸 **Snapshots (Slowly Changing Dimensions)**

To track historical changes over time, dbt snapshots are used for key entities:

  - raw_products_snapshots.yml
  - raw_users_snapshots.yml

These snapshots ensure changes to product and user attributes are fully auditable.

✅ **Data Quality & Testing**

The project includes a robust testing layer using dbt tests, including:

  - Generic tests (not null, unique, accepted values, relationships)
  - Custom data integrity validations
  - Unit-style tests for business logic correctness

⏱️ **Orchestration**

All dbt models and snapshots are orchestrated using Apache Airflow:

  - Scheduled DAG execution
  - Retry and SLA configuration for reliability
  - End-to-end automation of transformations

🛠️ **Tech Stack**

  - Snowflake – Cloud Data Warehouse
  - dbt Core – Data transformation & modeling
  - Apache Airflow – Workflow orchestration
  - SQL & Python – Transformations & automation

📈 **Outcome**

This pipeline delivers a scalable, testable, and production-ready analytics layer that enables reliable reporting, business insights, and downstream analytics use cases.
