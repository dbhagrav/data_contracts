create or replace procedure `gcp-edwprddata-prd-33200`.DCFRMWRKSNDDB.DC_TEST_INVALID_PRODUCT_PRC(fromdate TIMESTAMP)
  BEGIN
    SELECT "Semantic Rules - Check PRODUCT_ID Validity" as MONITOR_NAME, CONCAT("Invalid Ordered Item:", ORDERED_ITEM, ". Corresponding BK_PRODUCT_ID in EDW Refeence table BR_REFERENCEDB.N_PRODUCT is null") as VALIDATION_ERROR_MESSAGE, LINE_ID as TRX_ID, TO_JSON_STRING(t) AS SOURCE_SIMILAR_DATA from
    (select ORDERED_ITEM, LINE_ID, EDWBQ_CREATE_DTM
    FROM `gcp-edwprddata-prd-33200`.TRANS_NRTNCRDB.ST_SI_XXOPL_ORDER_LINES_ALL AS source LEFT JOIN `gcp-edwprddata-prd-33200`.BR_REFERENCEDB.N_PRODUCT AS target ON source.`ORDERED_ITEM` = target.`BK_PRODUCT_ID` WHERE NOT source.`ORDERED_ITEM` IS NULL AND target.`BK_PRODUCT_ID` IS NULL and source.EDWBQ_CREATE_DTM > fromdate ) t;
  END;


call `gcp-edwprddata-prd-33200`.DCFRMWRKSNDDB.DC_TEST_INVALID_PRODUCT_PRC('2018-01-01 00:00:00');