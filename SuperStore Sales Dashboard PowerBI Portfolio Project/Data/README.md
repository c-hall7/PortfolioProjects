## SuperStoreOrders.csv

### Downloaded dataset from Kaggle

One sheet including information about:
- Orders
  - order_id
  - order_date
  - year
- Shipping
  - ship_date
  - ship_mode
  - shipping_cost
  - order_priority
- Customers
  - customer_name
  - segment
  - state
  - country
  - market
  - region
- Products
  - product_id
  - category
  - sub_category
  - product_name
- Sales
  - sales
  - quantity
  - discount
  - profit
 
---

## Cleaned_SuperStoreOrders

### Cleaned, Star-Schema dataset to be used in PowerBI

#### FactSales

- CustomerID
- ProductKey
- order_id
- order_date
- ship_date
- order_priority
- ship_mode
- shipping_cost
- profit
- sales
- quantity
- discount

#### DimCustomer

- CustomerID
- customer_name
- country
- state
- region
- market
- segment

#### DimProduct

- ProductKey
- product_id
- product_name
- category
- sub_category

#### DimDate

- Date
- Month
- MonthNumber
- MonthYear
- Quarter
- Year
