/*
SQL script to initialize the database and create necessary schemas.
This script creates a database named 'datawarehouse' and three schemas: 'bronze', 'silver', and 'gold'.
*/

-- Create Database 'datawarehouse'
CREATE DATABASE datawarehouse;

-- Connect to the 'datawarehouse' database
\c datawarehouse;

-- Create Schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;