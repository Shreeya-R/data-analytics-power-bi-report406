-- How many staff are there in all of the UK stores?
SELECT * FROM dim_store;

SELECT 
    COUNT(staff_numbers) AS total_uk_staff
FROM dim_store
WHERE country = 'UK';

-- Total number of UK staff is 265.