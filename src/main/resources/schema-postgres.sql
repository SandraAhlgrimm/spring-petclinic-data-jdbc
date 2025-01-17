DROP TABLE IF EXISTS vet_specialty;
DROP TABLE IF EXISTS vet;
DROP TABLE IF EXISTS specialty;
DROP TABLE IF EXISTS visit;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS pet_type;
DROP TABLE IF EXISTS owner;

CREATE TABLE IF NOT EXISTS vet (
  id         INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  first_name TEXT,
  last_name  TEXT
);
CREATE INDEX ON vet (last_name);

CREATE TABLE IF NOT EXISTS specialty (
  id   INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name TEXT
);
CREATE INDEX ON specialty (name);

CREATE TABLE IF NOT EXISTS vet_specialty (
  vet       INT NOT NULL REFERENCES vet (id),
  specialty INT NOT NULL REFERENCES specialty (id),
  UNIQUE (vet, specialty)
);

CREATE TABLE IF NOT EXISTS pet_type (
  id   INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name TEXT
);
CREATE INDEX ON pet_type (name);

CREATE TABLE IF NOT EXISTS owner (
  id         INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  first_name TEXT,
  last_name  TEXT,
  address    TEXT,
  city       TEXT,
  telephone  TEXT
);
CREATE INDEX ON owner (last_name);

CREATE TABLE IF NOT EXISTS pet (
  id         INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  name       TEXT,
  birth_date DATE,
  type_id    INT NOT NULL REFERENCES pet_type (id),
  owner_id   INT REFERENCES owner (id),
  image_url  VARCHAR(255)
);
CREATE INDEX ON pet (name);
CREATE INDEX ON pet (owner_id);

CREATE TABLE IF NOT EXISTS visit (
  id          INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  pet_id      INT REFERENCES pet (id),
  visit_date  DATE,
  description TEXT
);
CREATE INDEX ON visit (pet_id);
