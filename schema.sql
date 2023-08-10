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
  FOREIGN KEY (label_id) REFERENCES labels(id),
);

CREATE TABLE book (
  id INT PRIMARY KEY REFERENCES items(id),
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(50) NOT NULL
);