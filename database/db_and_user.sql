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

CREATE DATABASE hdapp WITH  OWNER = sa_hdapp ENCODING = 'UTF8';