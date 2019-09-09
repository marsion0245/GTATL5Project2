
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
	

-- Table: public.category

-- DROP TABLE public.category;

CREATE TABLE public.category
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    alias character varying(100) COLLATE pg_catalog."default" NOT NULL,
    title character varying(250) COLLATE pg_catalog."default" NOT NULL,
    source_id integer NOT NULL,
    modified_date date NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY (id),
    CONSTRAINT category_uidx1 UNIQUE (alias)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.category
    OWNER to postgres;

-- Table: public.restaurant

-- DROP TABLE public.restaurant;

CREATE TABLE public.restaurant
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(250) COLLATE pg_catalog."default" NOT NULL,
    business_id character varying(100) COLLATE pg_catalog."default" NOT NULL,
    state_id integer NOT NULL,
    city character varying(100) COLLATE pg_catalog."default" NOT NULL,
    street character varying(250) COLLATE pg_catalog."default" NOT NULL,
    zip_code character varying(10) COLLATE pg_catalog."default" NOT NULL,
    price_range integer NOT NULL,
    rating numeric(3,1) NOT NULL,
    is_closed boolean NOT NULL,
    source_id integer NOT NULL,
    modified_date date NOT NULL,
    CONSTRAINT restaurant_pk PRIMARY KEY (id),
    CONSTRAINT restaurant_uidx1 UNIQUE (business_id)
,
    CONSTRAINT restaurant_fk1 FOREIGN KEY (state_id)
        REFERENCES public.state (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.restaurant
    OWNER to postgres;
	
	
-- Table: public.restaurant_category

-- DROP TABLE public.restaurant_category;

CREATE TABLE public.restaurant_category
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    restaurant_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT restaurant_category_pk PRIMARY KEY (id),
    CONSTRAINT restaurant_category_udx1 UNIQUE (restaurant_id, category_id)
,
    CONSTRAINT restaurant_category_fk1 FOREIGN KEY (restaurant_id)
        REFERENCES public.restaurant (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT restaurant_category_fk2 FOREIGN KEY (category_id)
        REFERENCES public.category (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.restaurant_category
    OWNER to postgres;
	
	
-- Table: public.state

-- DROP TABLE public.state;

CREATE TABLE public.state
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    name_a2 character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT state_pk PRIMARY KEY (id),
    CONSTRAINT state_uidx1 UNIQUE (name_a2)

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.state
    OWNER to postgres;

-- Table: public.state_pce

-- DROP TABLE public.state_pce;

CREATE TABLE public.state_pce
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    state_id integer NOT NULL,
    year date NOT NULL,
    off_premises_food_beverages integer NOT NULL,
    change_pct numeric(5,2) NOT NULL,
    source_id integer NOT NULL,
    modified_date date NOT NULL,
    CONSTRAINT state_pce_pk PRIMARY KEY (id),
    CONSTRAINT state_pce_udx1 UNIQUE (state_id, year)
,
    CONSTRAINT state_pce_fk1 FOREIGN KEY (state_id)
        REFERENCES public.state (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.state_pce
    OWNER to postgres;
COMMENT ON TABLE public.state_pce
    IS 'Personal Consumption Expenditure per State';
	

-- Table: public.state_population

-- DROP TABLE public.state_population;

CREATE TABLE public.state_population
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    state_id integer NOT NULL,
    population integer NOT NULL,
    year integer NOT NULL,
    source_id integer NOT NULL,
    modified_date timestamp(4) with time zone NOT NULL DEFAULT now(),
    CONSTRAINT state_population_pk PRIMARY KEY (id),
    CONSTRAINT state_population_udx1 UNIQUE (state_id, year)
,
    CONSTRAINT state_population_fk1 FOREIGN KEY (state_id)
        REFERENCES public.state (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.state_population
    OWNER to postgres;


	
