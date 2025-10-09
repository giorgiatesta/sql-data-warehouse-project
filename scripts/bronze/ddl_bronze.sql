/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

-- Create tables for crm source files
DROP TABLE IF EXISTS bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
    cst_id INTEGER PRIMARY KEY,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status VARCHAR(50),
    cst_gndr VARCHAR(10),
    cst_create_date DATE
);


DROP TABLE IF EXISTS bronze.crm_prd_info 

CREATE TABLE bronze.crm_prd_info (
    prd_info INTEGER,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INTEGER,
    prd_line VARCHAR(10),
    prd_start_dt DATE,
    prd_end_dt DATE
);


DROP TABLE IF EXISTS bronze.crm_sales_details 

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_ke VARCHAR(50),
    sls_cust_id INTEGER,
    sls_order_dt INTEGER,
    sls_ship_dt INTEGER, 
    sls_due_date INTEGER,
    sls_sales INTEGER,
    sls_quantity INTEGER,
    sls_prince INTEGER
);


-- Create tables for erp source files
DROP TABLE IF EXISTS bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(50)
);


DROP TABLE IF EXISTS bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50)
);


DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2 

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id VARCHAR(50),
    cat VARCHAR(50),
    subat VARCHAR(50),
    maintenance VARCHAR(10)
);
