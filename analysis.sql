-- ================================================
-- Hotel Operations Analysis: LuxurStay Hotels
-- ================================================

-- TASK 1: Data Cleaning
-- Clean the branch table to fix invalid and inconsistent values
SELECT
    id,
    CASE
        WHEN UPPER(TRIM(location)) IN ('EMEA', 'NA', 'LATAM', 'APAC') 
        THEN UPPER(TRIM(location))
        ELSE 'Unknown'
    END AS location,
    CASE
        WHEN total_rooms BETWEEN 1 AND 400 THEN total_rooms
        ELSE 100
    END AS total_rooms,
    COALESCE(
        staff_count,
        CASE
            WHEN total_rooms BETWEEN 1 AND 400 THEN total_rooms
            ELSE 100
        END * 1.5
    ) AS staff_count,
    CASE
        WHEN opening_date ~ '^[0-9]+$' 
            AND opening_date::int BETWEEN 2000 AND 2023
        THEN opening_date::int
        ELSE 2023
    END AS opening_date,
    CASE
        WHEN UPPER(TRIM(target_guests)) IN ('LEISURE', 'L', 'L.') THEN 'Leisure'
        WHEN UPPER(TRIM(target_guests)) IN ('BUSINESS', 'B', 'B.') OR 
             TRIM(target_guests) ILIKE 'busniess%' OR
             TRIM(target_guests) ILIKE 'busines%'
        THEN 'Business'
        ELSE 'Leisure'
    END AS target_guests
FROM branch;


-- TASK 2: Service Performance by Branch
-- Calculate average and max time taken per service per branch
SELECT
    service_id,
    branch_id,
    ROUND(AVG(time_taken), 2) AS avg_time_taken,
    MAX(time_taken) AS max_time_taken
FROM request
GROUP BY service_id, branch_id;


-- TASK 3: Meal and Laundry Requests in EMEA and LATAM
-- Identify specific service requests across key regions
SELECT
    s.description,
    b.id,
    b.location,
    r.id AS request_id,
    r.rating
FROM request r
JOIN service s ON r.service_id = s.id
JOIN branch b ON r.branch_id = b.id
WHERE s.description IN ('Meal', 'Laundry')
AND b.location IN ('EMEA', 'LATAM');


-- TASK 4: Underperforming Services
-- Identify service/branch combinations with average rating below 4.5
SELECT
    service_id,
    branch_id,
    ROUND(AVG(rating), 2) AS avg_rating
FROM request
GROUP BY service_id, branch_id
HAVING AVG(rating) < 4.5;
