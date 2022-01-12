USE ROLE "DAA.Creator.SBX";
USE WAREHOUSE COMPUTE_WH;

-- Change before failure point
INSERT INTO EDW.CICD_SPIKE.TEST_TABLE_JB
VALUES ('5','Before Failure point','before failure point','before failure point');

-- Failure Point
CALL EDW.CICD_SPIKE.TEST_TABLE_JB_INSERT('Test')

-- Change after failure point
INSERT INTO EDW.CICD_SPIKE.TEST_TABLE_JB
VALUES ('6','After Failure point','after failure point','after failure point');