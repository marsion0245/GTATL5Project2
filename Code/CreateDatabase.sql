
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
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Alias" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Title" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "Category_PK" PRIMARY KEY ("Id"),
    CONSTRAINT "Category_UIDX1" UNIQUE ("Alias")

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Category"
    OWNER to postgres;
	

-- Table: public."Restaturant"

-- DROP TABLE public."Restaturant";

CREATE TABLE public."Restaturant"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "Name" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "BusinessId" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "StateId" integer NOT NULL,
    "City" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "Street" character varying(250) COLLATE pg_catalog."default" NOT NULL,
    "ZipCode" character varying(10) COLLATE pg_catalog."default" NOT NULL,
    "PriceRange" integer NOT NULL,
    "Rating" numeric(3,1) NOT NULL,
    "IsClosed" boolean NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "Restaturant_PK" PRIMARY KEY ("Id"),
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
	

-- Table: public."RestaurantCategory"

-- DROP TABLE public."RestaurantCategory";

CREATE TABLE public."RestaurantCategory"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "RestaurantId" integer NOT NULL,
    "CategoryId" integer NOT NULL,
    CONSTRAINT "RestaurantCategory_PK" PRIMARY KEY ("Id"),
    CONSTRAINT "RestaurantCategory_UDX1" UNIQUE ("RestaurantId", "CategoryId")
,
    CONSTRAINT "RestaurantCategory_FK1" FOREIGN KEY ("RestaurantId")
        REFERENCES public."Restaturant" ("Id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT "RestaurantCategory_FK2" FOREIGN KEY ("CategoryId")
        REFERENCES public."Category" ("Id") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."RestaurantCategory"
    OWNER to postgres;
	

-- Table: public."State"

-- DROP TABLE public."State";

CREATE TABLE public."State"
(
    "Id" integer NOT NULL,
    "Name" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Name_A2" character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "State_PK" PRIMARY KEY ("Id"),
    CONSTRAINT "State_UIDX1" UNIQUE ("Name_A2")

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
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "StateId" integer NOT NULL,
    "Year" date NOT NULL,
    "OffPremisesFoodBeverages" integer NOT NULL,
    "ChangePct" numeric(5,2) NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "StatePCE_PK" PRIMARY KEY ("Id"),
    CONSTRAINT "StatePCE_UIDX1" UNIQUE ("StateId", "Year")
,
    CONSTRAINT "StatePCE_FK1" FOREIGN KEY ("StateId")
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
	

-- Table: public."StatePopulation"

-- DROP TABLE public."StatePopulation";

CREATE TABLE public."StatePopulation"
(
    "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "StateId" integer NOT NULL,
    "Population" integer NOT NULL,
    "Year" date NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL,
    CONSTRAINT "StatePopulation_PK" PRIMARY KEY ("Id"),
    CONSTRAINT "StatePopulation_UIDX1" UNIQUE ("StateId", "Year")

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."StatePopulation"
    OWNER to postgres;
	



	

