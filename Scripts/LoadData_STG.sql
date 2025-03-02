--Create CRM tables
CREATE TABLE  crm.cust_info(
    cst_id INT, -- Assuming cst_id is an integer
    cst_key VARCHAR(255), -- Adjust length as needed
    cst_firstname VARCHAR(255), -- Adjust length as needed
    cst_lastname VARCHAR(255), -- Adjust length as needed
    cst_marital_status VARCHAR(50), -- Adjust length as needed
    cst_gndr VARCHAR(10), -- Adjust length as needed
    cst_create_date DATETIME2 -- Or DATE, DATETIME, depending on precision
);

 CREATE TABLE crm.prd_info (
    prd_id INT, -- Assuming prd_id is an integer
    prd_key VARCHAR(255), -- Adjust length as needed
    prd_nm VARCHAR(255), -- Adjust length as needed
    prd_cost DECIMAL(10, 2), -- Adjust precision and scale as needed
    prd_line VARCHAR(100), -- Adjust length as needed
    prd_start_dt DATETIME2, -- Or DATE, DATETIME, depending on precision
    prd_end_dt DATETIME2 -- Or DATE, DATETIME, depending on precision
);


CREATE TABLE crm.sales_details (
    sls_ord_num VARCHAR(50) NULL, -- Adjust length as needed, allow NULL
    sls_prd_key VARCHAR(255) NULL, -- Adjust length as needed, allow NULL
    sls_cust_id VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_order_dt VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_ship_dt VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_due_dt VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_sales VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_quantity VARCHAR(50) NULL, -- Treat as VARCHAR to load anything, allow NULL
    sls_price VARCHAR(50) NULL -- Treat as VARCHAR to load anything, allow NULL
);

--Create ERP Tables

CREATE TABLE erp.CUST_AZ12(
    CID VARCHAR(50), -- Adjust length as needed, could be INT if purely numeric
    BDATE VARCHAR(50), -- Or DATETIME2, DATETIME, depending on precision
    GEN VARCHAR(50) -- Or VARCHAR(10) if you need more descriptive gender values
);

CREATE TABLE erp.LOC_A101 (
    CID VARCHAR(50), -- Adjust length as needed, could be INT if purely numeric
    CNTRY VARCHAR(255) -- Adjust length based on the longest country name
);

CREATE TABLE erp.PX_CAT_G1V2 (
    ID VARCHAR(255), -- Assuming ID is an integer identifier
    CAT VARCHAR(255), -- Adjust length as needed
    SUBCAT VARCHAR(255), -- Adjust length as needed
    MAINTENANCE VARCHAR(255) -- Adjust length as needed
);

--Load CRM data


BULK INSERT  crm.cust_info
FROM '/tmp/Datasets/source_crm/cust_info.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);

BULK INSERT  crm.prd_info
FROM '/tmp/Datasets/source_crm/prd_info.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);


BULK INSERT  crm.sales_details
FROM '/tmp/Datasets/source_crm/sales_details.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);

--Load ERP DATA

BULK INSERT  erp.CUST_AZ12
FROM '/tmp/Datasets/source_erp/CUST_AZ12.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);

BULK INSERT  erp.LOC_A101
FROM '/tmp/Datasets/source_erp/LOC_A101.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);


BULK INSERT  erp.PX_CAT_G1V2
FROM '/tmp/Datasets/source_erp/PX_CAT_G1V2.csv' -- Path inside the container
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row if present
);
