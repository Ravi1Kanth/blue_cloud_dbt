--select * from RAW.JAFFLE_SHOP.CUSTOMERS
--where id>50


--Need customers with names and order details
{{ config(materialized = 'table') }}

with customers as (
select * from {{ ref('stg_customers') }}
),

orders as (
select * from {{ ref('stg_orders') }}
),

final as (
select customers.id as cust_id, customers.first_name, customers.last_name, orders.id as order_id, orders.order_date from customers 
left join orders on customers.id = orders.USER_ID)

select * from final