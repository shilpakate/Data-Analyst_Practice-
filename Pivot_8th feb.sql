create table sales(
product varchar(50),
Region varchar(50),
Amount decimal(10,2)
)

insert into sales (Product,Region,Amount)
values 
('A','South',100),
('B','South',500),
('A','North',800),
('B','North',300)

select * from sales 

-- Sum of product as per Region
--Use Pivot

select Product,
sum(case when region='South' then Amount  End) as South,
sum(case when region='North' then Amount End) as North
from Sales
group by product



select *
from
 (select Product,Region,Amount from sales)As Source_table
 Pivot(
 sum(amount)
 for region in ([North],[South])
 ) as Pivottable
