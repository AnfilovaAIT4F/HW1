--# Home-work-BONDS


-- I hope you've already downloaded all the necessary programs (otherwise I don't know how my work got to you for a review). If it was the worst, download the pirate Windows and Microsoft office, install it as you like. Then download PostgreSQL Database for your system (https://www.enterprisedb.com/downloads/postgres-postgresql-downloads), agree to all the terms and conditions when installing it, and opt out of additional add-ons (warning: never do this again!). As a result, you should have a host with the number 5432 and an individual password. To open the program and check the readiness to work use the search on the computer "pgAdmin 4" and click on the face of the elephant, then open the server and enter the password, go to the tab "public".

-- Download tables from yandex-disk (https://yadi.sk/d/osSdoLhMuTFXdw - Bonds - there are 3 tables) relocate all files into C:\Users\Public\Bonds (Bonds - new folder that was created specially for the first homework) and save all in CSV (commas - separators) format

-- To successfully create the first table

-- Change in excel Settings - parameters - optional - use system separators - whole and fractional parts separator - point. Change formats of columns of excel-table (bond_description_task) HaveOffer, AmortisedMty and IsConvertible to numeric, save and then get back common format (change dates for 1 or 0 you can do it by hands or use excel function =IF(ISTEXT(N)=TRUE;N;DATEVALUE(N)) - it works not all the time or =LEFT(N;1) then don't forget to hide commas). 

-- Click on Harry Potter lightning bolt at the left part of interface and copy code below

-- This code will create new empty table with 51 columns 

CREATE TABLE public.bond_description_task

(

    "ISIN, RegCode, NRDCode" text NOT NULL,

    "FinToolType" text NOT NULL,

    "SecurityType" text ,

    "SecurityKind" text ,

    "CouponType" text ,

    "RateTypeNameRus_NRD" text ,

    "CouponTypeName_NRD" text ,

    "HaveOffer" boolean,

    "AmortisedMty" boolean,

    "MaturityGroup" text ,

    "IsConvertible" boolean,

    "ISINCode" text NOT NULL,

    "Status" text NOT NULL,

    "HaveDefault" boolean,

    "IsLombardCBR_NRD" boolean,

    "IsQualified_NRD" boolean,

    "ForMarketBonds_NRD" boolean,

    "MicexList_NRD" text,

    "Basis" text,

    "Basis_NRD" text,

    "Base_Month" text,

    "Base_Year" text,

    "Coupon_Period_Base_ID" smallint,

    "AccruedintCalcType" boolean,

    "IsGuaranteed" boolean,

    "GuaranteeType" text,

    "GuaranteeAmount" text,

    "GuarantVal" bigint,

    "Securitization" text,

    "CouponPerYear" smallint,

    "Cp_Type_ID" smallint,

    "NumCoupons" smallint,

    "NumCoupons_M" smallint,

    "NumCoupons_NRD" smallint,

    "Country" text NOT NULL,

    "FaceFTName" text NOT NULL,

    "FaceFTName_M" smallint,

    "FaceFTName_NRD" text,

    "FaceValue" real,

    "FaceValue_M" smallint,

    "FaceValue_NRD" real,

    "CurrentFaceValue_NRD" real,

    "BorrowerName" text NOT NULL,

    "BorrowerOKPO" bigint,

    "BorrowerSector" text,

    "BorrowerUID" integer,

    "IssuerName" text NOT NULL,

    "IssuerName_NRD" text,

    "IssuerOKPO" integer,

    "NumGuarantors" smallint,

    "EndMtyDate" date

);

-- This additional code will set ISINCode as Primary Key in the table bond_description_task 
 
ALTER TABLE public.bond_description_task ADD PRIMARY KEY ("ISINCode");

--For Mac users add this row at the beginning in code below

--ALTER DATABASE postgres SET datestyle TO "ISO, DMY"; 

COPY public.bond_description_task

FROM 'c:/Users/User/Downloads/bond_description_task.csv'

DELIMITERS ';' CSV HEADER ENCODING 'WIN 1251'
;

-- This part will fill created table (You need to specify the appropriate path to the file on your computer)
	
-- To successfully create the second table

-- Change formats of columns of excel-table (quotes_task) TIME, BUYBACKDATE and MAT_DATE short date format and ISSUESIZE, VOL_ACC and numeric and hide commas.

-- This code will create new empty table with 34 columns

CREATE TABLE public.quotes_task

(

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

    "YIELD_BID" real
 
);

--For Mac users add

--ALTER DATABASE postgres SET datestyle TO "ISO, DMY"; 

COPY public.quotes_task

FROM 'c:/Users/User/Downloads/quotes_task.csv'

DELIMITERS ';' CSV HEADER ENCODING 'WIN 1251'
;

-- This part will fill created table (You need to specify the appropriate path to the file on your computer)


-- This code will create new empty table with 4 columns


CREATE TABLE public.listing_task

(

    "ID" bigint NOT NULL,

    "ISIN" text COLLATE pg_catalog."default" NOT NULL,

    "Platform" text COLLATE pg_catalog."default" NOT NULL,

    "Section" text COLLATE pg_catalog."default" NOT NULL,

    CONSTRAINT "listing_task_pkey" PRIMARY KEY ("ID")

);

--For Mac users add

--ALTER DATABASE postgres SET datestyle TO "ISO, DMY"; 

COPY public.listing_task

FROM 'c:/Users/User/Downloads/listing_task.csv'

DELIMITERS ';' CSV HEADER ENCODING 'WIN 1251'
;

-- This part will fill created table (You need to specify the appropriate path to the file on your computer)



-- Lets suppose that information about emitents (bonds_description_task) consists of: IssuerName , IssuerName_NRD, IssuerOKPO (only the first column has no NULLs).

-- Also information about trading platform (quotes_task) consists of: BOARDID and BOARDNAME

-- The code below will improve the table with exchanges: create new columns, in which you can set the necessary data

alter table public.listing_task

add column "IssuerName" text,

add column "IssuerName_NRD" text,

add column "IssuerOKPO" bigint,

add column "BOARDID" text,

add column "BOARDNAME" text;

-- The two codes below will upload the necessary data to listing_task about the exchange and issuers from bond_description_task and quotes_task

Update listing_task

SET "IssuerName" = public.bond_description_task."IssuerName",

"IssuerName_NRD" = public.bond_description_task."IssuerName_NRD",

"IssuerOKPO" = public.bond_description_task."IssuerOKPO"

FROM public.bond_description_task

WHERE public.listing_task."ISIN" = public.bond_description_task."ISINCode";


UPDATE listing_task

SET "BOARDID" = public.quotes_task."BOARDID",

"BOARDNAME" = public.quotes_task."BOARDNAME"

FROM public.quotes_task

WHERE public.listing_task."ISIN" = public.quotes_task."ISIN";

-- As a result, we will get a table that fully meets the requirements of task two. Do not be afraid that it has empty parts, it will not affect the quality of the fourth task

-- Concerning the third task: probably, for other purposes it will be expedient to establish external keys, but as the final problem is solved without them, this action is excessive and it is possible not to carry out it (and also problem is connected with our data: we have empty cells and repetitions.


--You'll find a lot of English words and a large and incomprehensible code ahead of you, so relax, drink Yorkshire Golden Tea... mm...Magestic.

--And now it's a joke especially for you:

--I once asked my diploma:

--Is the topic of my work relevant?

--The diploma answered:

--Of course.

--It was a lie of pure water.

-- This big ugly guy below is a single nested code that performs the fourth task (creating a table with issuer fields (actually IssuerName), ISIN and a fraction of cases when ASK = NULL as a decimal fraction). First look at it, admire it, and be horrified, (little bit lower I wrote a parse with explanations).
 
SELECT DISTINCT(public.listing_task."IssuerName") as "Issuer"

	, public.listing_task."ISIN"

	, total_collapse."non_ratio"  

from public.listing_task 

inner join 

	(SELECT quotes_task."ISIN"

	 	, round(1 - count("ASK")::numeric/count(*),3) as "non_ratio"

	 FROM quotes_task

		group by "ISIN") as total_collapse 

	on listing_task."ISIN" = total_collapse."ISIN" 

		and listing_task."Platform" like '%Московская Биржа%' 

		and listing_task."Section" like '%Основной%'

		and total_collapse."non_ratio" > 0.1;






-- total_collapse - table combining 2 ISIN and non_ratio that colculated as division of day with NULL ask and total mentions about ISIN, then groups that all by ISIS.

-- merge created table with listing_task according to actual restrictions(Platform - Moscow Exchange / Moscow Exchange - RTS, trading mode - Main / Main CI, non_ratio >0.1) and gets from this distinct Issuers, their ISIN and non_ratio

-- That's all. If you have any questions left, write to me on GitHub, VK, Gmail. I hope you had fun and pleasure! GL HF, see you the next home work. 
