DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists; --create new table


CREATE TABLE artists (
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);
