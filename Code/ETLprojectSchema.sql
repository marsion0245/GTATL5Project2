--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

-- Started on 2019-09-08 04:47:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 204 (class 1259 OID 17247)
-- Name: Category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Category" (
    "Id" integer NOT NULL,
    "Alias" character varying(100) NOT NULL,
    "Title" character varying(250) NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL
);


ALTER TABLE public."Category" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 17245)
-- Name: Category_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Category" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Category_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 198 (class 1259 OID 17188)
-- Name: Restaturant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Restaturant" (
    "Id" integer NOT NULL,
    "Name" character varying(250) NOT NULL,
    "BusinessId" character varying(100) NOT NULL,
    "StateId" integer NOT NULL,
    "City" character varying(100) NOT NULL,
    "Street" character varying(250) NOT NULL,
    "ZipCode" character varying(10) NOT NULL,
    "PriceRange" integer NOT NULL,
    "Rating" numeric(3,1) NOT NULL,
    "IsClosed" boolean NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL
);


ALTER TABLE public."Restaturant" OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 17186)
-- Name: Restaturant_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Restaturant" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Restaturant_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 17256)
-- Name: RestaurantCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RestaurantCategory" (
    "Id" integer NOT NULL,
    "RestaurantId" integer NOT NULL,
    "CategoryId" integer NOT NULL
);


ALTER TABLE public."RestaurantCategory" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 17254)
-- Name: RestaurantCategory_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."RestaurantCategory" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."RestaurantCategory_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 196 (class 1259 OID 17071)
-- Name: State; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."State" (
    "Id" integer NOT NULL,
    "Name" character varying(50) NOT NULL,
    "Name_A2" character(2) NOT NULL
);


ALTER TABLE public."State" OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 17224)
-- Name: StatePCE; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StatePCE" (
    "Id" integer NOT NULL,
    "StateId" integer NOT NULL,
    "Year" date NOT NULL,
    "OffPremisesFoodBeverages" integer NOT NULL,
    "ChangePct" numeric(5,2) NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL
);


ALTER TABLE public."StatePCE" OWNER TO postgres;

--
-- TOC entry 2869 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "StatePCE"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."StatePCE" IS 'Personal Consumer Expenditure by State';


--
-- TOC entry 199 (class 1259 OID 17222)
-- Name: StatePCE_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."StatePCE" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."StatePCE_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 17238)
-- Name: StatePopulation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StatePopulation" (
    "Id" integer NOT NULL,
    "StateId" integer NOT NULL,
    "Population" integer NOT NULL,
    "Year" date NOT NULL,
    "SourceId" integer NOT NULL,
    "Date" date NOT NULL
);


ALTER TABLE public."StatePopulation" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 17236)
-- Name: StatePopulation_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."StatePopulation" ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."StatePopulation_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2731 (class 2606 OID 17251)
-- Name: Category Category_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2733 (class 2606 OID 17253)
-- Name: Category Category_UIDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_UIDX1" UNIQUE ("Alias");


--
-- TOC entry 2719 (class 2606 OID 17195)
-- Name: Restaturant Restaturant_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaturant"
    ADD CONSTRAINT "Restaturant_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2735 (class 2606 OID 17260)
-- Name: RestaurantCategory RestaurantCategory_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RestaurantCategory"
    ADD CONSTRAINT "RestaurantCategory_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2737 (class 2606 OID 17262)
-- Name: RestaurantCategory RestaurantCategory_UDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RestaurantCategory"
    ADD CONSTRAINT "RestaurantCategory_UDX1" UNIQUE ("RestaurantId", "CategoryId");


--
-- TOC entry 2721 (class 2606 OID 17197)
-- Name: Restaturant Restaurant_UIDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaturant"
    ADD CONSTRAINT "Restaurant_UIDX1" UNIQUE ("BusinessId");


--
-- TOC entry 2723 (class 2606 OID 17228)
-- Name: StatePCE StatePCE_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePCE"
    ADD CONSTRAINT "StatePCE_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2725 (class 2606 OID 17230)
-- Name: StatePCE StatePCE_UIDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePCE"
    ADD CONSTRAINT "StatePCE_UIDX1" UNIQUE ("StateId", "Year");


--
-- TOC entry 2727 (class 2606 OID 17242)
-- Name: StatePopulation StatePopulation_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePopulation"
    ADD CONSTRAINT "StatePopulation_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2729 (class 2606 OID 17244)
-- Name: StatePopulation StatePopulation_UIDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePopulation"
    ADD CONSTRAINT "StatePopulation_UIDX1" UNIQUE ("StateId", "Year");


--
-- TOC entry 2715 (class 2606 OID 17075)
-- Name: State State_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_PK" PRIMARY KEY ("Id");


--
-- TOC entry 2717 (class 2606 OID 17077)
-- Name: State State_UIDX1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."State"
    ADD CONSTRAINT "State_UIDX1" UNIQUE ("Name_A2");


--
-- TOC entry 2741 (class 2606 OID 17263)
-- Name: RestaurantCategory RestaurantCategory_FK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RestaurantCategory"
    ADD CONSTRAINT "RestaurantCategory_FK1" FOREIGN KEY ("RestaurantId") REFERENCES public."Restaturant"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2742 (class 2606 OID 17268)
-- Name: RestaurantCategory RestaurantCategory_FK2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RestaurantCategory"
    ADD CONSTRAINT "RestaurantCategory_FK2" FOREIGN KEY ("CategoryId") REFERENCES public."Category"("Id") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2738 (class 2606 OID 17198)
-- Name: Restaturant Restaurant_FK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Restaturant"
    ADD CONSTRAINT "Restaurant_FK1" FOREIGN KEY ("StateId") REFERENCES public."State"("Id");


--
-- TOC entry 2739 (class 2606 OID 17231)
-- Name: StatePCE StatePCE_FK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePCE"
    ADD CONSTRAINT "StatePCE_FK1" FOREIGN KEY ("StateId") REFERENCES public."State"("Id");


--
-- TOC entry 2740 (class 2606 OID 17273)
-- Name: StatePopulation StatePopulation_FK1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StatePopulation"
    ADD CONSTRAINT "StatePopulation_FK1" FOREIGN KEY ("StateId") REFERENCES public."State"("Id");


-- Completed on 2019-09-08 04:47:27

--
-- PostgreSQL database dump complete
--

