# Hotel Operations Analysis — LuxurStay Hotels

## Overview
LuxurStay Hotels is an international hotel chain experiencing a drop in 
customer satisfaction ratings due to slow room service across branches. 
This project uses SQL to identify the root causes and pinpoint the 
worst-performing branches and services.

## Business Problem
Customer satisfaction has fallen below the expected 4.5 rating. 
Management needs data-driven insights to identify which branches 
and services are underperforming.

## Tasks Completed

**Task 1 — Data Cleaning**
Cleaned the branch table by fixing invalid locations, room counts, 
staff counts, opening dates, and target guest categories using 
CASE statements, COALESCE, TRIM, and regex validation.

**Task 2 — Service Performance**
Calculated average and maximum time taken per service per branch 
to identify slow service areas.

**Task 3 — Regional Service Analysis**
Filtered Meal and Laundry requests specifically for EMEA and LATAM 
regions using multi-table JOINs.

**Task 4 — Underperforming Services**
Identified all service and branch combinations with an average 
customer rating below 4.5 using GROUP BY and HAVING.

## Tools & Skills Used
- SQL (PostgreSQL)
- Data Cleaning & Validation
- Aggregation & Grouping
- Multi-table JOINs
- Filtering with HAVING

## Dataset
Data provided via DataCamp — includes Service, Request, and Branch tables.

## About
Completed as part of the DataCamp SQL Associate Practical Exam.
