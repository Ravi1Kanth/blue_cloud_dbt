with orders as (
select id, USER_ID, order_date from raw.JAFFLE_SHOP.orders
)

select* from orders