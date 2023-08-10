CREATE DATABASE my_catalog;

CREATE TABLE label (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT false,
  label_id INT,
  author_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE book (
  id INT PRIMARY KEY REFERENCES items(id),
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(50) NOT NULL
);

CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  PRIMARY KEY(id)
);

CREATE TABLE games(
    id INTGENERATED ALWAYS AS IDENTITY,
    last_palyed DATE,
    multiplayer BOOLEAN,
    CONSTRAINT item_fk FOREIGN KEY (id) REFERENCES items (id)
)

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    item_id INT NOT NULL,
    on_spotify BOOLEAN NOT NULL
    FOREIGN KEY (item_id) REFERENCES items(id)
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);