update `gcp-edwprddata-prd-33200.DCFRMWRKSNDDB.MC_DC_SCHEMA_HEADER_INFO` set LAST_VALIDATION_DATE = TIMESTAMP_SUB(current_timestamp(), INTERVAL 1000 DAY) where data_domain = 'SALES' and table_name = 'ST_SI_XXOPL_ORDER_LINES_ALL'