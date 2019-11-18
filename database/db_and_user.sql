-- Role: sa_hdapp
-- DROP ROLE sa_hdapp;

CREATE ROLE sa_hdapp WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

  -- Database: hdapp

-- DROP DATABASE hdapp;

CREATE DATABASE hdapp
    WITH 
    OWNER = sa_hdapp
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;