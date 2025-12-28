----Create Table

create table Healthcare (
	Name VARCHAR NOT NULL,
	Age Integer NOT NULL,
	Gender VARCHAR NOT NULL,
	BMI Numeric NOT NULL,
	Children Integer NOT NULL,
	Smoking_Status VARCHAR NOT NULL,
	Location VARCHAR NOT NULL,
	Insurance_Price Numeric NOT NULL
);

----Fetch Data

Select * from Healthcare;

-----How many total customers are in the database?

Select distinct count(Name) as Total_customer from healthcare;

----What is the average insurance price?

Select Round(Avg(Insurance_price),2) AS Avg_price from healthcare; 

----What are the minimum and maximum insurance prices?

Select 
	Min(Insurance_price) as Min_price ,
	Max(Insurance_price) as Max_price 
	from healthcare;

----How many customers are there by gender?

Select count(Name),Gender from Healthcare
	group by Gender;

----What is the average age of customers?

Select Round(Avg(Age),2) from healthcare;

----How many customers are smokers vs non-smokers?

Select count(name),Smoking_Status from Healthcare
	group by Smoking_Status;

----What is the average BMI across customers?

Select round(AVG(BMI),2) FROM Healthcare;

----Which location has the highest number of customers?

Select Count(Name),Location from Healthcare
Group by location order by Location;

----What is the average insurance price by gender?

Select Round(AVG(Insurance_Price),2),gender from Healthcare
Group BY gender;

----How does smoking status affect insurance price?

Select Smoking_Status, Round(Avg(Insurance_Price),2) from Healthcare
group by Smoking_Status;

----How does insurance price vary by number of children?

Select Round(Avg(Insurance_Price),2),Children from Healthcare
group by Children order by children;

-----Are older customers paying higher premiums?

Select 
	Case
	When Age<30 Then 'Under 30'
	When Age Between 30 AND 45 Then '30-45'
	Else 'Above 45'
	End as Age_Group,
	Round(avg(insurance_price),2) As Avg_Price
	from Healthcare Group by Age_Group;

----How does BMI impact insurance pricing?

Select 
	case
	When BMI<18 Then 'Underweight'
	When BMI<25 Then 'normal'
	When BMI<30 Then 'Overweight'
	else 'obese'
	End as BMI_Group,
	Round(Avg(Insurance_Price),2) as Avg_Insurance
	from Healthcare group by BMI_Group;

---- Who are the top 10 highest-paying customers?

Select Name,Insurance_price from Healthcare
order by insurance_price Desc limit 10;

----What percentage of customers are smokers?

Select 
count(*) Filter(Where smoking_Status = 'Smoker')*100 / Count(*)
As Smoker_Percentage from Healthcare;

----Which gender + smoking status combination has the highest average insurance price?

Select Gender,Smoking_Status,Round(Avg(Insurance_Price),2) from Healthcare
Group by Gender,Smoking_Status
order by Avg(Insurance_Price) Desc
Limit 1;

----Which factor impacts insurance price more: age or BMI?

Select  
CORR(age, insurance_price) AS age_correlation,
CORR(bmi, insurance_price) AS bmi_correlation
FROM healthcare;

----Segment customers into cost buckets:

Select 
Case
When Insurance_Price<5000 Then 'Low cost'
When Insurance_Price Between 5000 And 15000 Then 'Medium cost'
Else 'High cost'
End AS Cost_Category,
count(name)	
	from Healthcare Group by Cost_Category;

---- Compare average insurance price of:High BMI smokers Low BMI non-smokers

SELECT 
    'High BMI Smokers' AS group_type,
    ROUND(AVG(insurance_price), 2)
FROM healthcare
WHERE bmi > 30 AND smoking_status = 'Smokers'

UNION ALL

SELECT 
    'Low BMI Non-Smokers',
    ROUND(AVG(insurance_price), 2)
FROM healthcare
WHERE bmi < 25 AND smoking_status = 'Non-Smokers';

----Identify high-risk customers:Age > 40 BMI > 30 Smoker

SELECT *
FROM healthcare
WHERE age > 40
  AND bmi > 30
  AND smoking_status = 'Smoker';

----Which location has the highest concentration of high-risk customers?

SELECT location, COUNT(*) AS high_risk_count
FROM healthcare
WHERE age > 40
  AND bmi > 30
  AND smoking_status = 'Smoker'
GROUP BY location
ORDER BY high_risk_count DESC
LIMIT 1;

----What is the potential average cost reduction if smokers reduce BMI below 25?

SELECT 
    ROUND(
        AVG(CASE WHEN bmi > 30 THEN insurance_price END)
        -
        AVG(CASE WHEN bmi < 25 THEN insurance_price END),
    2) AS potential_avg_savings
FROM healthcare
WHERE smoking_status = 'Smoker';

----Create a pricing recommendation flag based on:


SELECT 
    name,
    age,
    bmi,
    smoking_status,
    insurance_price,
    CASE
        WHEN smoking_status = 'Smoker' AND bmi > 30 THEN 'Increase Premium - High Risk'
        WHEN smoking_status = 'Smoker' THEN 'Increase Premium'
        WHEN bmi > 30 THEN 'Moderate Increase'
        ELSE 'Standard Pricing'
    END AS pricing_recommendation
FROM healthcare;