
-- Database: ETLproject

-- DROP DATABASE "ETLproject";

CREATE DATABASE "ETLproject"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE "ETLproject"
    IS 'Database created to store project data';
	

-- Table: public."Category"

-- DROP TABLE public."Category";

CREATE TABLE public."Category"
(
    "Id" integer NOT NULL,
    "Alias" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Title" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "RestaurantCategory_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "Ctagory_UIDX1" UNIQUE ("Alias")

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Category"
    OWNER to postgres;
	

-- DROP TABLE public."Restaturant";

CREATE TABLE public."Restaturant"
(
    "Id" integer NOT NULL,
    "Name" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "BusinessId" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "StateId" integer NOT NULL,
    "City" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Street" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "ZIP" character varying(25) COLLATE pg_catalog."default" NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "Restaturant_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "Restaurant_UIDX1" UNIQUE ("BusinessId")
,
    CONSTRAINT "Restaurant_FK1" FOREIGN KEY ("StateId")
        REFERENCES public."State" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Restaturant"
    OWNER to postgres;
	
	
-- Table: public."State"

-- DROP TABLE public."State";

CREATE TABLE public."State"
(
    "Id" integer NOT NULL,
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Name_A2" character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Idx2" PRIMARY KEY ("Id"),
    CONSTRAINT "Idx3" UNIQUE ("Name_A2")

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."State"
    OWNER to postgres;
	
	
-- Table: public."StatePCE"

-- DROP TABLE public."StatePCE";

CREATE TABLE public."StatePCE"
(
    "Id" integer NOT NULL,
    "StateId" integer NOT NULL,
    "Year" date NOT NULL,
    "OffPremisesFoodBeverages" integer NOT NULL,
    "ChangePct" numeric(5,2) NOT NULL,
    "Entered" date NOT NULL,
    "SourceId" integer NOT NULL,
    CONSTRAINT "StatePCE_pkey" PRIMARY KEY ("Id"),
    CONSTRAINT "Idx1" UNIQUE ("StateId", "Year")
,
    CONSTRAINT "FK1" FOREIGN KEY ("StateId")
        REFERENCES public."State" ("Id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."StatePCE"
    OWNER to postgres;
COMMENT ON TABLE public."StatePCE"
    IS 'Personal Consumer Expenditure by State';
