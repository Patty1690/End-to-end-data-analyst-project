select Contract, count(Contract),
count(Contract) * 100.00 / (select Count(*) from cust) as Percentage
from cust
group by Contract;


select Gender, count(Gender),
count(Gender) * 100.00 / (select count(*) from cust) as Percentage
from cust
group by Gender;

select Customer_Status, count(Customer_Status)as TotalCount, sum(Total_Revenue) as TotalRevenue, 
sum( Total_Revenue) * 100.00/ (select sum(Total_Revenue) from cust) as TotalPercentage
from cust
group by Customer_Status;

Select State, count(State) as TotalCount,
Count(State) * 100.00 / (select count(*) from cust) as Percentage
from cust
group by State
order by TotalCount desc;