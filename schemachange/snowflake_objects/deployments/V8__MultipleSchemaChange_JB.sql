USE ROLE "DAA.Creator.SBX";
USE WAREHOUSE COMPUTE_WH;

-- Create or Replace Stored Proc in first schema
CREATE OR REPLACE PROCEDURE EDW.CICD_SPIKE.TEST_TABLE_JB_INSERT(TEST_VAR varchar)
    RETURNS VARCHAR
    LANGUAGE JAVASCRIPT
    AS
    $$
        snowflake.execute( { sqlText:`INSERT INTO EDW.CICD_SPIKE.TEST_TABLE_JB ("TABLE_KY","TABLE_DESC","TABLE_DECS2") VALUES ('1','sample description','another sample description'),('2','this is a test','this is also a test');`} );
        return 'Done';
    $$;

-- Update Table in second schema
ALTER TABLE EDW.CICD_SPIKE_JB.TEST_TABLE_JB ADD COLUMN DESC_FIELD VARCHAR(16777216);

-- Insert values into second schema table
INSERT INTO EDW.CICD_SPIKE_JB.TEST_TABLE_JB
VALUES ('1','Test-Multiple Schema','Test-Multiple Schema Change Test');

-- Insert values into first schema table
INSERT INTO EDW.CICD_SPIKE.TEST_TABLE_JB
VALUES ('1','Test-Multiple Schema','Test-Multiple Schema Change Test');
