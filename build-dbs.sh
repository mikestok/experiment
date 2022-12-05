#! /usr/bin/env bash

set -e
set -x

mkdir -p dbs
rm -f dbs/bands*
  
sqlite3 dbs/bands1.db <<ETX

CREATE TABLE bands (
  id varchar(30) primary key,
  name varchar(256) not null
);

CREATE TABLE people (
  id varchar(30) primary key,
  name varchar(256) not null
);

CREATE TABLE memberships (
  band_id varchar(30) not null,
  person_id varchar(30) not null,
  start_date char(10),
  end_date char(10)
);

INSERT INTO bands(id, name)
VALUES ('0b4ea2c0-7b67-41b2-a1ab-05226685a06c', 'King Crimson');

INSERT INTO people(id, name)
VALUES ('f3c9e2b2-3ac8-486a-ab40-e32b6961accd', 'Bill Bruford');

INSERT INTO memberships(band_id, person_id, start_date, end_date)
VALUES
('0b4ea2c0-7b67-41b2-a1ab-05226685a06c', 'f3c9e2b2-3ac8-486a-ab40-e32b6961accd', '1972-09-01', '1974-09-30'),
('0b4ea2c0-7b67-41b2-a1ab-05226685a06c', 'f3c9e2b2-3ac8-486a-ab40-e32b6961accd', '1981-01-01', '1984-12-31'),
('0b4ea2c0-7b67-41b2-a1ab-05226685a06c', 'f3c9e2b2-3ac8-486a-ab40-e32b6961accd', '1994-01-01', '1997-12-04');

ETX

sqlite3 dbs/bands2.db <<ETX

CREATE TABLE bands (
  id varchar(30) primary key,
  name varchar(256) not null
);

CREATE TABLE people (
  id varchar(30) primary key,
  name varchar(256) not null
);

CREATE TABLE memberships (
  band_id varchar(30) not null,
  person_id varchar(30) not null,
  start_date char(10),
  end_date char(10)
);

INSERT INTO bands(id, name)
VALUES ('d683a79c-8732-4e38-a866-bb4898174313', 'Genesis');

INSERT INTO people(id, name)
VALUES ('f3c9e2b2-3ac8-486a-ab40-e32b6961accd', 'Bill Bruford');

INSERT INTO memberships(band_id, person_id, start_date, end_date)
VALUES
('d683a79c-8732-4e38-a866-bb4898174313', 'f3c9e2b2-3ac8-486a-ab40-e32b6961accd', '1976-03-01', '1976-07-31');

ETX
