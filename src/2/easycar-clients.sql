CREATE TABLE client(
   client_id   serial PRIMARY KEY,
   firstName   varchar(128),
   lastName    varchar(128),
   gender      varchar(128),
   birthday    date
);
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Archie','Smith','male','1999-10-08');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Duncan','Johnson','male','1980-12-04');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Felix','Williams','male','1984-01-13');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Fergus','Jones','male','1999-05-22');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Gregor','Brown','male','1987-12-21');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Jasper','Davis','male','1994-08-23');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Lachlan','Miller','male','2002-10-05');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Leo','Wilson','male','2006-01-26');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Lewis','Moore','male','1992-08-21');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Luca','Taylor','male','1988-12-11');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Emily','Anderson','female','1982-02-01');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Madison','Thomas','female','1997-07-05');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Emma','Jackson','female','1971-11-01');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Hannah','White','female','1983-01-10');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Olivia','Harris','female','2002-12-06');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Abigail','Martin','female','2009-04-24');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Isabella','Thompson','female','1990-02-16');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Ashley','Garcia','female','1980-01-09');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Samantha','Martinez','female','1988-11-24');
INSERT INTO client (firstName,lastName,gender,birthday) VALUES ('Elizabeth','Robinson','female','1968-12-24');
