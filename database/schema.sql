-- -----------------------------------------------------------------------------
-- Creates the schema for the hdapp database
-- -----------------------------------------------------------------------------

-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;
-- SET default_tablespace = '';
-- SET default_table_access_method = heap;

-- -----------------------------------------------------------------------------
-- Table: statuses
CREATE TABLE public.statuses (
    "sID"           integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "sName"         VARCHAR(50) NOT NULL,
    "sCreatedOn"    TIMESTAMP DEFAULT now(),
    "sUpdatedOn"    TIMESTAMP DEFAULT now(),

    CONSTRAINT pk_statuses PRIMARY KEY ("sID")
); ALTER TABLE public.statuses OWNER TO sa_hdapp;

-- -----------------------------------------------------------------------------
-- Table: Users
CREATE TABLE public.users (
    "uID"           integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "uEmail"        VARCHAR(150),
    "uName"         VARCHAR(40) NOT NULL,
    "uFullName"     VARCHAR(128),
    "uBio"          VARCHAR(2048),
    "uStatus"       integer NOT NULL,
    "uCreatedOn"    TIMESTAMP DEFAULT now(),
    "uUpdatedOn"    TIMESTAMP DEFAULT now(),

    CONSTRAINT pk_users PRIMARY KEY ("uID"),
    CONSTRAINT fk_users_statuses FOREIGN KEY ("uStatus") REFERENCES public.statuses ("sID")
); ALTER TABLE public.users OWNER TO sa_hdapp;

-- -----------------------------------------------------------------------------
-- View: vw_users
CREATE VIEW public.vw_users AS
 SELECT users."uID" AS "ID",
    users."uName" AS "Name",
    users."uEmail" AS "e-Mail",
    statuses."sName" AS "Status"
   FROM (public.users
     LEFT JOIN public.statuses ON ((statuses."sID" = users."uStatus")));
ALTER VIEW public.vw_users OWNER TO sa_hdapp;

-- -----------------------------------------------------------------------------
-- Table: Passwords
CREATE TABLE public.passwords (
    "pwdID"         integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "pwdUser"       integer NOT NULL,
    "pwdPhrase"     VARCHAR(128) NOT NULL,
    "pwdValidUntil" date NOT NULL,
    "pwdStatus"     INT NOT NULL,

    CONSTRAINT pk_passwords PRIMARY KEY ("pwdID"),
    CONSTRAINT fk_passwords_users FOREIGN KEY ("pwdUser") REFERENCES public.users ("uID"),
    CONSTRAINT fk_passwords_status FOREIGN KEY ("pwdStatus") REFERENCES public.statuses ("sID")
); ALTER TABLE public.passwords OWNER to sa_hdapp;

-- -----------------------------------------------------------------------------
-- Table: Configs
CREATE TABLE  public.configs (
    "cfgID"         integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    "cfgName"       varchar(40) NOT NULL,
    "cfgDesc"       varchar(128),
    "cfgValue"      varchar(256),
    "cfgCreatedOn"  timestamp NOT NULL DEFAULT now(),
    "cfgMOdifiedOn" timestamp NOT NULL DEFAULT now(),
    "cfgStatus"     int NOT NULL,

    CONSTRAINT pk_configs PRIMARY KEY ("cfgID"),
    CONSTRAINT uk_configs_name UNIQUE ("cfgName"),
    CONSTRAINT fk_configs_statuses FOREIGN KEY ("cfgStatus") REFERENCES public.statuses ("sID")
); ALTER TABLE public.configs OWNER to sa_hdapp;

-- -----------------------------------------------------------------------------
-- Table: Logs
CREATE TABLE public.logs (
    "logTimeStamp"  TIMESTAMP NOT NULL DEFAULT now(),
    "logText"       TEXT NOT NULL
); ALTER TABLE public.logs OWNER TO sa_hdapp;