-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE orbits_around(
  id SERIAL PRIMARY KEY,
  sun_name TEXT UNIQUE NOT NULL
);

INSERT INTO orbits_around (sun_name)
VALUES 
('The Sun'),
('Proxima Centauri'),
('Gliese 876');


CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT 
);

INSERT INTO galaxies (galaxy_name)
VALUES
('Milky Way');

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  planet_name TEXT UNIQUE NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES orbits_around(id) ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES Galaxies(id) ON DELETE SET NULL,
  has_moons BOOLEAN DEFAULT false
);

INSERT INTO planets
  (planet_name, orbital_period_in_years, orbits_around, galaxy_id, has_moons)
VALUES
  ('Earth', 1.00, 1, 1, true),
  ('Mars', 1.88, 1, 1, true),
  ('Venus', 0.62, 1, 1, false),
  ('Neptune', 164.8, 1, 1, true),
  ('Proxima Centauri b', 0.03, 2, 1, false),
  ('Gliese 876 b', 0.23, 3, 1, false);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  moon_name TEXT UNIQUE NOT NULL,
  planet_id INTEGER REFERENCES planets(id) NOT NULL
);

INSERT INTO moons (moon_name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);
