--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-11-18 09:08:57

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

SET default_table_access_method = heap;

--
-- TOC entry 203 (class 1259 OID 16434)
-- Name: statuses; Type: TABLE; Schema: public; Owner: sa_hdapp
--

CREATE TABLE public.statuses (
    "sID" integer NOT NULL,
    "sName" character varying(50) NOT NULL
);


ALTER TABLE public.statuses OWNER TO sa_hdapp;

--
-- TOC entry 202 (class 1259 OID 16432)
-- Name: statuses_sID_seq; Type: SEQUENCE; Schema: public; Owner: sa_hdapp
--

ALTER TABLE public.statuses ALTER COLUMN "sID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."statuses_sID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 205 (class 1259 OID 16455)
-- Name: users; Type: TABLE; Schema: public; Owner: sa_hdapp
--

CREATE TABLE public.users (
    "uID" integer NOT NULL,
    "uEmail" character varying(150),
    "uName" character varying(40) NOT NULL,
    "uStatus" integer NOT NULL
);


ALTER TABLE public.users OWNER TO sa_hdapp;

--
-- TOC entry 204 (class 1259 OID 16453)
-- Name: users_uID_seq; Type: SEQUENCE; Schema: public; Owner: sa_hdapp
--

ALTER TABLE public.users ALTER COLUMN "uID" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."users_uID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 206 (class 1259 OID 16471)
-- Name: vw_users; Type: VIEW; Schema: public; Owner: sa_hdapp
--

CREATE VIEW public.vw_users AS
 SELECT users."uID" AS "ID",
    users."uName" AS "Name",
    users."uEmail" AS "e-Mail",
    statuses."sName" AS "Status"
   FROM (public.users
     LEFT JOIN public.statuses ON ((statuses."sID" = users."uStatus")));


ALTER TABLE public.vw_users OWNER TO sa_hdapp;

--
-- TOC entry 2698 (class 2606 OID 16438)
-- Name: statuses statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: sa_hdapp
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY ("sID");


--
-- TOC entry 2700 (class 2606 OID 16461)
-- Name: users unique_user_name; Type: CONSTRAINT; Schema: public; Owner: sa_hdapp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_user_name UNIQUE ("uName");


--
-- TOC entry 2702 (class 2606 OID 16459)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: sa_hdapp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("uID");


--
-- TOC entry 2703 (class 2606 OID 16462)
-- Name: users fkey_status; Type: FK CONSTRAINT; Schema: public; Owner: sa_hdapp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkey_status FOREIGN KEY ("uStatus") REFERENCES public.statuses("sID");


-- Completed on 2019-11-18 09:08:58

--
-- PostgreSQL database dump complete
--

