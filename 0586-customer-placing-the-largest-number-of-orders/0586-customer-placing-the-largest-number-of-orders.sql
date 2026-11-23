with counting as 
(select *,
        count(customer_number) over(partition by customer_number ) as cnt
 from Orders)
 select distinct customer_number 
 from counting
 where cnt in (select max(cnt) over() from counting)