CREATE TABLE book(
  id     serial PRIMARY KEY,
  title  text
);

CREATE TABLE subject(
  id     serial PRIMARY KEY,
  name   varchar(50)
);

CREATE TABLE author(
  id     serial PRIMARY KEY,
  name   varchar(50)
);

CREATE TABLE publisher(
  id     serial PRIMARY KEY,
  name   varchar(100)
);

CREATE TABLE book_to_subject(
  id          serial PRIMARY KEY,
  book_id     INTEGER REFERENCES book(id),
  subject_id  INTEGER REFERENCES subject(id)
);

CREATE TABLE book_to_author(
  id         serial PRIMARY KEY,
  book_id    INTEGER REFERENCES book(id),
  author_id  INTEGER REFERENCES author(id)
);

CREATE TABLE edition(
  id            serial PRIMARY KEY,
  isbn10        varchar(10),
  isbn13        varchar(13),
  book_id       INTEGER REFERENCES book(id),
  publisher_id  INTEGER REFERENCES publisher(id),
  pubyear       INTEGER,
  price         real
);

CREATE TABLE edition_parameter(
  id     serial PRIMARY KEY,
  name   varchar(20)
);

CREATE TABLE edition_parameter_value(
  id             serial PRIMARY KEY,
  parameter_id   INTEGER REFERENCES edition_parameter(id),
  edition_id     INTEGER REFERENCES edition(id),
  value          real
)