--** The script is dumped by *ZSQL/EXP* tool, Zenith@Huawei Gauss Dept.
--** Dumped time: 2021-09-10 15:00:55.991

-- EXPORT TYPE = SCHEMA
-- EXPORT OBJECTS = SPCAI
-- FILE TYPE = TXT
-- DUMP FILE = spcai_metadata.dmp
-- LOG FILE = 
-- QUERY = ""
-- COMPRESS = N
-- CONSISTENT = N
-- CONTENT_MODE = METADATA_ONLY
-- SKIP_COMMENTS = N
-- FORCE = N
-- SKIP_ADD_DROP_TABLE = N
-- SKIP_TRIGGERS = N
-- QUOTE_NAMES = Y
-- TABLESPACE = N
-- COMMIT_BATCH = 1000
-- INSERT_BATCH = 1
-- FEEDBACK = 10000
-- PARALLEL = 0
-- TENANT = N
-- CREATE_USER = N
-- ROLE = N
-- GRANT = N
-- WITH_CR_MODE = N
-- WITH_FORMAT_CSF = Y
-- INDEX_PARTITIONS = N

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF';
ALTER SESSION SET NLS_TIMESTAMP_TZ_FORMAT = 'YYYY-MM-DD HH24:MI:SS.FF TZH:TZM';
ALTER SESSION SET NLS_TIME_FORMAT = 'HH:MI:SS.FF AM';
ALTER SESSION SET NLS_TIME_TZ_FORMAT = 'HH:MI:SS.FF AM TZR';


ALTER SESSION SET CURRENT_SCHEMA = SPCAI;
DROP TABLE IF EXISTS "MSPC_MODEL" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_MODEL"
(
  "ID" BINARY_BIGINT NOT NULL,
  "PRODUCT_ID" VARCHAR(64 BYTE) NOT NULL,
  "PROCESS_ROUTE" VARCHAR(64 BYTE),
  "MEASUREMENT_ROUTE" VARCHAR(64 BYTE),
  "LAYER" VARCHAR(64 BYTE),
  "MODEL_TYPE" VARCHAR(64 BYTE) NOT NULL,
  "CATEGORY_TYPE" VARCHAR(64 BYTE) NOT NULL,
  "MODEL_PARAMETERS" CLOB NOT NULL,
  "DATA_STATUS" BINARY_INTEGER NOT NULL,
  "CREATE_TIME" DATE,
  "UPDATE_TIME" DATE,
  "MODEL_STATUS" VARCHAR(64 BYTE)
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
ALTER TABLE "MSPC_MODEL" ADD CONSTRAINT "MSPC_MODEL_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MSPC_MODEL_FEATURE" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_MODEL_FEATURE"
(
  "ID" BINARY_BIGINT NOT NULL,
  "NAME" VARCHAR(64 BYTE),
  "OPERATION" VARCHAR(64 BYTE) NOT NULL,
  "DCITEM_NAME" VARCHAR(64 BYTE),
  "CREATE_TIME" DATE,
  "UPDATE_TIME" DATE,
  "FEATURE_ORDER" BINARY_BIGINT NOT NULL,
  "MODEL_ID" BINARY_BIGINT NOT NULL
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
CREATE INDEX "IDX_MSPC_MODEL_FEATURE" ON "MSPC_MODEL_FEATURE"("MODEL_ID")
TABLESPACE "SPCAI"
INITRANS 2
PCTFREE 8;
ALTER TABLE "MSPC_MODEL_FEATURE" ADD CONSTRAINT "MSPC_MODEL_FEATURE_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MSPC_FEATURE_VALUE" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_FEATURE_VALUE"
(
  "ID" BINARY_BIGINT NOT NULL,
  "LOT_ID" VARCHAR(64 BYTE) NOT NULL,
  "VALUE" NUMBER,
  "OPERATION" VARCHAR(64 BYTE),
  "DCITEM_NAME" VARCHAR(64 BYTE),
  "UPDATE_TIME" DATE,
  "MES_RAW_DATA_ID" NUMBER
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
CREATE INDEX "IDX_MSPC_FEATURE_VALUE" ON "MSPC_FEATURE_VALUE"("LOT_ID")
TABLESPACE "SPCAI"
INITRANS 2
PCTFREE 8;
ALTER TABLE "MSPC_FEATURE_VALUE" ADD CONSTRAINT "MSPC_FEATURE_VALUE_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MSPC_EVALUATE_RESULTS" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_EVALUATE_RESULTS"
(
  "ID" VARCHAR(64 BYTE) NOT NULL,
  "LOT_ID" VARCHAR(64 BYTE),
  "MODEL_ID" BINARY_BIGINT NOT NULL,
  "VALUE" NUMBER,
  "CREATE_TIME" DATE,
  "UPDATE_TIME" DATE,
  "LCL" NUMBER,
  "CL" NUMBER,
  "UCL" NUMBER,
  "VIOLATED_INFO" CLOB
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
CREATE INDEX "IDX_MSPC_EVALUATE_RESULTS" ON "MSPC_EVALUATE_RESULTS"("MODEL_ID")
TABLESPACE "SPCAI"
INITRANS 2
PCTFREE 8;
ALTER TABLE "MSPC_EVALUATE_RESULTS" ADD CONSTRAINT "MSPC_EVALUATE_RESULTS_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MSPC_LOT_STATUS" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_LOT_STATUS"
(
  "ID" BINARY_BIGINT NOT NULL,
  "LOT_ID" VARCHAR(64 BYTE) NOT NULL,
  "MODEL_ID" BINARY_BIGINT NOT NULL,
  "IS_READY" BINARY_INTEGER NOT NULL,
  "IS_TRAINED" BINARY_INTEGER NOT NULL,
  "IS_EVALUATED" BINARY_INTEGER NOT NULL,
  "UPDATE_TIME" DATE
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
CREATE INDEX "IDX_MSPC_LOT_STATUS" ON "MSPC_LOT_STATUS"("LOT_ID", "MODEL_ID")
TABLESPACE "SPCAI"
INITRANS 2
PCTFREE 8;
ALTER TABLE "MSPC_LOT_STATUS" ADD CONSTRAINT "MSPC_LOT_STATUS_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MES_RAW_DATA" CASCADE CONSTRAINTS;
CREATE TABLE "MES_RAW_DATA"
(
  "ID" VARCHAR(64 BYTE) NOT NULL,
  "FIXTURE_ID" VARCHAR(64 BYTE),
  "RETICLE_ID_LIST" VARCHAR(512 BYTE),
  "PROCESS_TIME" DATE,
  "PROCESS_OPERATION" VARCHAR(64 BYTE),
  "PROCESS_ROUTE" VARCHAR(64 BYTE),
  "PROCESS_EQUIPMENT_GROUP" VARCHAR(64 BYTE),
  "PROCESS_LOGICAL_RECIPE" VARCHAR(64 BYTE),
  "PROCESS_RECIPE" VARCHAR(64 BYTE),
  "PROCESS_OPERATION_SEQ" VARCHAR(64 BYTE),
  "OPERATOR" VARCHAR(64 BYTE),
  "MEASUREMENT_TIME" DATE,
  "MEASUREMENT_OPERATION" VARCHAR(64 BYTE),
  "MEASUREMENT_ROUTE" VARCHAR(64 BYTE),
  "MEASUREMENT_EQUIPMENT_GROUP" VARCHAR(64 BYTE),
  "MEASUREMENT_LOGICAL_RECIPE" VARCHAR(64 BYTE),
  "MEASUREMENT_OPERATION_SEQ" VARCHAR(64 BYTE),
  "BATCH_ID" VARCHAR(64 BYTE),
  "LOT_ID" VARCHAR(64 BYTE),
  "TECHNOLOGY" VARCHAR(64 BYTE),
  "LOT_TYPE" VARCHAR(64 BYTE),
  "PRODUCT_GROUP_ID" VARCHAR(64 BYTE),
  "EDC_TYPE" VARCHAR(64 BYTE),
  "RETICLE_ID" VARCHAR(64 BYTE),
  "MEASUREMENT_STAGE" VARCHAR(64 BYTE),
  "PROCESS_STAGE" VARCHAR(64 BYTE),
  "MEASUREMENT_EQUIPMENT_ID" VARCHAR(64 BYTE),
  "MEASUREMENT_RECIPE" VARCHAR(64 BYTE),
  "MEASUREMENT_DEPARTMENT" VARCHAR(64 BYTE),
  "PROCESS_EQUIPMENT_ID" VARCHAR(64 BYTE),
  "PROCESS_FLOW_ID" VARCHAR(64 BYTE),
  "MEASUREMENT_TYPE" VARCHAR(64 BYTE),
  "OCAP_INSTANCE_ID" VARCHAR(64 BYTE),
  "PROCESS_DEPARTMENT" VARCHAR(64 BYTE),
  "PRODUCT_ID" VARCHAR(64 BYTE),
  "PROCESS_ROUTE_SEQ" VARCHAR(64 BYTE),
  "MEASUREMENT_ROUTE_SEQ" VARCHAR(64 BYTE),
  "PROCESS_FAB" VARCHAR(64 BYTE),
  "MONITOR_LOT_TYPE" VARCHAR(64 BYTE),
  "RECEIVE_TIME" DATE
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
CREATE INDEX "IDX_MSPC_MES_RAW_DATA" ON "MES_RAW_DATA"("PRODUCT_ID", "PROCESS_ROUTE", "PROCESS_OPERATION")
TABLESPACE "SPCAI"
INITRANS 2
PCTFREE 8;
ALTER TABLE "MES_RAW_DATA" ADD CONSTRAINT "MES_RAW_DATA_PK" PRIMARY KEY("ID");

DROP TABLE IF EXISTS "MSPC_CODE_INFO" CASCADE CONSTRAINTS;
CREATE TABLE "MSPC_CODE_INFO"
(
  "ID" VARCHAR(64 BYTE) NOT NULL,
  "FUNCTION" VARCHAR(64 BYTE),
  "INFO" CLOB,
  "COST_TIME" DATE,
  "UPDATE_TIME" DATE
)
TABLESPACE "SPCAI"
INITRANS 2
MAXTRANS 255
PCTFREE 8
FORMAT ASF;
ALTER TABLE "MSPC_CODE_INFO" ADD CONSTRAINT "MSPC_CODE_INFO_PK" PRIMARY KEY("ID");

-- end of exp: 2021-09-10 15:00:56.066
