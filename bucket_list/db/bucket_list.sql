DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS attractions;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS continents;

CREATE TABLE continents(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  img VARCHAR
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  continent_id INT REFERENCES continents(id) ON DELETE CASCADE
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  visit BOOLEAN,
  country_id INT REFERENCES countries(id)ON DELETE CASCADE
);

CREATE TABLE attractions(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  city_id INT REFERENCES cities(id) ON DELETE CASCADE
);

CREATE TABLE reviews(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  review TEXT,
  review_rating INT,
  attraction_id INT REFERENCES attractions(id) ON DELETE CASCADE
);
