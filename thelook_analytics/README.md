# TheLook eCommerce — dbt Analytics Project

An end-to-end analytics engineering project built with dbt Core and BigQuery.
It transforms raw TheLook eCommerce data into a clean, tested star schema,
ready for business analysis.

## Data

Source: `bigquery-public-data.thelook_ecommerce` (public dataset), copied to a US-region dataset for processing.
Five raw tables: users, orders, order_items, products, distribution_centers.

## Architecture

The project follows a layered dbt structure:

- **Staging** (`stg_`) — one model per source table: selects, renames and lightly cleans raw data.
- **Marts** — business-ready models built from staging:
  - **Dimensions** (`dim_`): users, products, orders, distribution_centers
  - **Fact** (`fct_order_items`): grain = one sold item; includes a calculated `profit` measure (sale_price − cost)

The fact table references dimensions through foreign keys, forming a star schema.

## Data Quality

16 data tests, all passing:
- **Uniqueness & not-null** on every dimension primary key
- **Referential integrity** (`relationships` tests) ensuring every foreign key in the fact table exists in its dimension

## Business Insight

Example analysis — profit by product category:

| Category | Profit (USD) |
|---|---|
| Outerwear & Coats | 721,615 |
| Jeans | 582,948 |
| Sweaters | 436,353 |
| Suits & Sport Coats | 396,163 |

Higher-priced apparel categories (outerwear, jeans) drive the most profit, suggesting these are the most valuable segments to prioritize.

## How to Run

```bash
dbt run      # build staging and marts models
dbt test     # run all 16 data quality tests
dbt compile  # compile analyses for ad-hoc querying
```

## Stack

dbt Core · BigQuery · GoogleSQL