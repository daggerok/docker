CREATE USER app_user
  WITH PASSWORD 'password'
  SUPERUSER
  CREATEDB
  CREATEROLE
  REPLICATION
  BYPASSRLS
;

-- CREATE DATABASE app_db
--   OWNER app_user
-- ;
--
-- GRANT ALL PRIVILEGES ON DATABASE app_db to app_user
-- ;

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT INSERT, UPDATE, DELETE ON TABLES TO app_user
;

-- -- or
-- GRANT SELECT, INSERT, UPDATE, DELETE
--   ON ALL TABLES
--   IN SCHEMA public
--   TO app_user
-- ;

CREATE TABLE IF NOT EXISTS items
(
  id SERIAL NOT NULL
    CONSTRAINT items_pk
    PRIMARY KEY ,
  title VARCHAR(255) NOT NULL ,
  description VARCHAR(1024) NULL
)
;

INSERT INTO items (title) VALUES
  ('one'),
  ('two'),
  ('three')
;
