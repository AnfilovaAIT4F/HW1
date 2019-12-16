--Создание 1 таблицы
DROP TABLE if exists public.listing_task
;

CREATE TABLE public.listing_task
(
   "ID" int NOT NULL,
	"ISIN" text NOT NULL,
	"Platform" text NOT NULL,
	"Section" text NOT NULL,
	CONSTRAINT listing_task_pkey PRIMARY KEY ("ID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.listing_task
    OWNER to postgres;
--Загрузка данных в 1 таблицу	
copy public.listing_task  FROM 'C:/Users/Public/listing_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';

--Создание 2 таблицы

DROP TABLE if exists public.bond_description_task
;
CREATE TABLE public.bond_description_task
(
   "ISIN, RegCode, NRDCode" text NOT NULL,
	"FinToolType" text NOT NULL,
	"SecurityType" text,
	"SecurityKind" text,
	"CouponType" text,
	"RateTypeNameRus_NRD" text,
	"CouponTypeName_NRD" text,
	"HaveOffer" boolean NOT NULL,
	"AmortisedMty" boolean NOT NULL,
	"MaturityGroup" text,
	"IsConvertible" boolean NOT NULL,
	"ISIN code" text NOT NULL,
	"Status" text NOT NULL,
	"HaveDefault" boolean NOT NULL,
	"GuaranteeType" text,
	"GuaranteeAmount" text,
	"BorrowerName" text NOT NULL,
	"BorrowerOKPO" int ,
	"BorrowerSector" text,
	"BorrowerUID" int NOT NULL,
	"IssuerName" text NOT NULL,
	"IssuerName_NRD" text,
	"IssuerOKPO" int,
	"NumGuarantors" smallint NOT NULL,
	"EndMtyDate" date,
	CONSTRAINT bond_description_task_pkey PRIMARY KEY ("ISIN, RegCode, NRDCode")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.bond_description_task
    OWNER to postgres;
--Загрузка данных во 2 таблицу	
copy public.bond_description_task  FROM 'C:/Users/Public/bond_description_task.csv' DELIMITER ';' CSV HEADER ENCODING 'WIN 1251';

--Создание 3 таблицы
DROP TABLE if exists public.quotes_task
;
--в столбце TIME смена формата на дата, так же замена во всей таблице запятых на точки, для возможности использовать формат real
--Так же надо поменять формат столбцов в эксель таблице у BUYBACKDATE и MAT_DATE на короткий формат даты и ISSUESIZE, VOL_ACC
CREATE TABLE public.quotes_task(
    "ID" int NOT NULL,
    "TIME" date NOT NULL,
    "ACCRUEDINT" real,
    "ASK" real,
    "ASK_SIZE" integer,
    "ASK_SIZE_TOTAL" integer,
    "AVGE_PRCE" real,
    "BID" real,
    "BID_SIZE" integer,
    "BID_SIZE_TOTAL" integer,
    "BOARDID" text,
    "BOARDNAME" text,
    "BUYBACKDATE" date,
    "BUYBACKPRICE" real,
    "CBR_LOMBARD" real,
    "CBR_PLEDGE" real,
    "CLOSE" real,
    "CPN" real,
    "CPN_DATE" date,
    "CPN_PERIOD" smallint,
    "DEAL_ACC" bigint,
    "FACEVALUE" real,
    "ISIN" text,
    "ISSUER" text,
    "ISSUESIZE" bigint,
    "MAT_DATE" date,
    "MPRICE" real,
    "MPRICE2" real,
    "SPREAD" real,
    "VOL_ACC" bigint,
    "Y2O_ASK" real,
    "Y2O_BID" real,
    "YIELD_ASK" real,
    "YIELD_BID" real)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.quotes_task
    OWNER to postgres;
--Загрузка данных в 3 таблицу	
copy public.quotes_task 
FROM 'C:/Users/Public/quotes_task.csv' DELIMITER ';' CSV HEADER  ENCODING 'WIN 1251';

