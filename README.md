# Healthcare-Insurance-Pricing-Dataset
📌 Project Overview

This project analyzes healthcare insurance data to identify key drivers of insurance pricing and high-risk customer segments.
The objective is to support pricing optimization, risk management, and preventive health strategies using data-driven insights.

🎯 Business Problem

A health insurance company observed rising claim costs and inconsistent premium pricing.
The leadership team needed answers to:

What factors increase insurance costs?

Who are the high-risk customers?

How can long-term costs be reduced through prevention?

📂 Dataset Description

The dataset contains customer-level healthcare and demographic information.

Columns Used:

Name – Customer identifier

Age – Customer age

Gender – Male / Female

BMI – Body Mass Index

Children – Number of dependents

Smoking Status – Smoker / Non-smoker

Location – Customer region

Insurance Price – Annual insurance premium (USD)

🧹 Data Cleaning & Validation (Excel)

Checked for missing and inconsistent values

Standardized categorical fields (Gender, Smoking Status)

Verified numeric ranges (Age, BMI, Insurance Price)

Created helper fields:

Age Group

BMI Category

Risk Category

🔍 Data Analysis (PostgreSQL)

Key SQL techniques used:

GROUP BY, CASE WHEN

Aggregations (AVG, COUNT)

Customer segmentation

Correlation analysis

Key Insights:

Smoking is the largest contributor to high insurance costs

Obese customers have significantly higher premiums

High-risk customers are typically:

Age > 40

BMI > 30

Smokers

Certain locations have a higher concentration of high-risk customers

📊 Data Visualization (Tableau)

An interactive dashboard was created to visualize:

Insurance price by smoking status

Insurance price by BMI and age group

Risk segmentation

Location-wise high-risk customer distribution

💡 Business Recommendations

Implement risk-based pricing models

Introduce BMI reduction and smoking cessation incentives

Focus preventive health programs in high-risk locations

Segment customers into low, medium, and high-risk categories

🛠 Tools & Technologies

Excel – Data cleaning and validation

PostgreSQL – Data manipulation and analysis

Tableau – Data visualization and storytelling

📈 Key Takeaway

This project demonstrates how raw healthcare data can be transformed into actionable business insights that support strategic decision-making in insurance pricing and risk management.

📬 Contact

If you’d like to discuss this project or data analytics opportunities, feel free to connect with me on LinkedIn.
