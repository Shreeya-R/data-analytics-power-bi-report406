-- List of Table names
SELECT table_name 
FROM information_schema.tables
WHERE table_schema = 'public';

-- All column names from orders table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'orders';

-- All column names from country_region table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'country_region';

-- All column names from dim_customer table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'dim_customer';

-- All column names from dim_product table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'dim_product';

-- All column names from dim_store table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'dim_store';

-- All column names from forquerying2 table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'forquerying2';

-- All column names from forview table
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'forview';