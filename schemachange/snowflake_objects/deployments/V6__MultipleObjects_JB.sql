use role "DAA.Creator.SBX";
use schema EDW.CICD_SPIKE;

-- Create Table
CREATE OR REPLACE TABLE EDW.CICD_SPIKE.TEST_TABLE_JB
(
	TABLE_KY VARCHAR(16777216),
    TABLE_DESC VARCHAR(16777216)
);


-- Alter Table
ALTER TABLE EDW.CICD_SPIKE.TEST_TABLE_JB ADD COLUMN TABLE_DECS2 VARCHAR(16777216);


-- Create Stored Proc
CREATE OR REPLACE PROCEDURE EDW.CICD_SPIKE.TEST_TABLE_JB_INSERT(TEST_VAR varchar)
    RETURNS VARCHAR
    LANGUAGE JAVASCRIPT
    AS
    $$
          var rs = snowflake.execute( { sqlText: 
                                                `INSERT INTO EDW.CICD_SPIKE.TEST_TABLE_JB ("TABLE_KY","TABLE_DESC","TABLE_DECS2")
                                                            VALUES ('1','sample description','another sample description'),('2','this is a test','this is also a test');`
                                    } );
        return 'Done';
    $$;

USE WAREHOUSE COMPUTE_WH;
-- Run Stored Proc
CALL EDW.CICD_SPIKE.TEST_TABLE_JB_INSERT('test');