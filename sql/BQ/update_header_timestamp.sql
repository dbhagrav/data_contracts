update `gcp-edwprddata-prd-33200.DCFRMWRKSNDDB.MC_DC_SCHEMA_HEADER_INFO` set LAST_VALIDATION_DATE = TIMESTAMP_SUB(current_timestamp(), INTERVAL 7 DAY) where data_domain = 'HR' and table_name = 'FPA_JOB_POSTING_DETAIL'