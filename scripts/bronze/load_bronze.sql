CREATE OR REPLACE PROCEDURE bronze.load_bronze()
LANGUAGE plpgsql
AS $$

DECLARE 
     v_start_time TIMESTAMP;
     v_end_time TIMESTAMP;
     v_row_count BIGINT;
     batch_start_time TIMESTAMP;
     batch_end_time TIMESTAMP;

    -- 1. Empty the tables before loading new data
    -- 2. Load CSV data into the tables

BEGIN
    batch_start_time := clock_timestamp();

    RAISE NOTICE '=========================================';
    RAISE NOTICE 'Loading Bronze Layer';
    RAISE NOTICE '=========================================';

    -- CRM Tables
    RAISE NOTICE '-----------------------------------------';
    RAISE NOTICE 'Loading CRM Tables';
    RAISE NOTICE '-----------------------------------------';

    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.crm_cust_info RESTART IDENTITY;
        COPY bronze.crm_cust_info
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_crm/cust_info.csv'
        WITH (
            FORMAT csv,
            HEADER true,
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Loaded crm_cust_info: % rows in % s',
        v_row_count,
        EXTRACT(SECOND FROM (v_end_time - v_start_time));


    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.crm_prd_info RESTART IDENTITY;
        COPY bronze.crm_prd_info 
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_crm/prd_info.csv'
        WITH (
            FORMAT csv,
            HEADER true,
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Load crm_prd_info: % rows in % s',
        v_row_count,
        EXTRACT(SECOND FROM (v_end_time - v_start_time));


    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.crm_sales_details RESTART IDENTITY;
        COPY bronze.crm_sales_details
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_crm/sales_details.csv'
        WITH (
            FORMAT csv,
            HEADER true, 
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Load crm_sales_details: % rows in % s',
    v_row_count,
    EXTRACT(SECOND FROM (v_end_time - v_start_time));

    RAISE NOTICE 'CRM tables loaded successfully.';


    -- ERP Tables
    RAISE NOTICE '-----------------------------------------';
    RAISE NOTICE 'Loading ERP Tables';
    RAISE NOTICE '-----------------------------------------';

    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.erp_cust_az12 RESTART IDENTITY;
        COPY bronze.erp_cust_az12 
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_erp/CUST_AZ12.csv'
        WITH (
            FORMAT csv,
            HEADER true,
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Load erp_cust_az12: % rows in % s',
    v_row_count,
    EXTRACT(SECOND FROM (v_end_time - v_start_time));


    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.erp_loc_a101 RESTART IDENTITY;
        COPY bronze.erp_loc_a101
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_erp/LOC_A101.csv'
        WITH (
            FORMAT csv,
            HEADER true,
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Load erp_loc_a101: % rows in % s',
    v_row_count,
    EXTRACT(SECOND FROM (v_end_time - v_start_time));

    v_start_time := clock_timestamp();
        TRUNCATE TABLE bronze.erp_px_cat_g1v2 RESTART IDENTITY;
        COPY bronze.erp_px_cat_g1v2
        FROM '/Users/gio/Desktop/github/warehouse/sql-data-warehouse-project/data/source_erp/PX_CAT_G1V2.csv'
        WITH (
            FORMAT csv,
            HEADER true,
            DELIMITER ',',
            NULL ''
        );
        GET DIAGNOSTICS v_row_count = ROW_COUNT;
    v_end_time := clock_timestamp();
    RAISE NOTICE 'Load erp_px_cat_g1v2: % rows in % s',
    v_row_count,
    EXTRACT(SECOND FROM (v_end_time - v_start_time));

    RAISE NOTICE 'ERP tables loaded successfully.';
    
    batch_end_time := clock_timestamp();

    RAISE NOTICE '=========================================';
    RAISE NOTICE 'Bronze Layer load completed successfully!';
    RAISE NOTICE '  - Total Load Duration % s',
    EXTRACT(SECOND FROM (batch_end_time - batch_start_time));
    RAISE NOTICE '=========================================';

EXCEPTION
    WHEN OTHERS THEN
        RAISE WARNING '❌ ERROR OCCURRED DURING LOADING BRONZE LAYER';
        RAISE NOTICE 'Error message: %', SQLERRM;
        RAISE NOTICE 'Error state  : %', SQLSTATE;
END;
$$;


-- To execute the procedure
CALL bronze.load_bronze();


-- 3. Verify that the data has been loaded correctly
SELECT *
FROM bronze.crm_cust_info
LIMIT 10;

SELECT *
FROM bronze.crm_prd_info
LIMIT 10;

SELECT *
FROM bronze.crm_sales_details
LIMIT 10;

SELECT *
FROM bronze.erp_cust_az12
LIMIT 10;

SELECT *
FROM bronze.erp_loc_a101

SELECT *
FROM bronze.erp_px_cat_g1v2
LIMIT 10;