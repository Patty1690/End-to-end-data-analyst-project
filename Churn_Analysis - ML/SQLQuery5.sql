Create view vw_churn as
	select * from clean_Churn where Customer_Status in ('Stayed', 'Churned');

Create view vw_joined as
	select * from clean_Churn where Customer_Status = 'Joined';

select count(*) as TotalChurnRow from vw_churn;
select count(*) as TotalJoinedRow from vw_joined;