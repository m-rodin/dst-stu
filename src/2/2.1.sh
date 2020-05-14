#!/bin/bash

rm easycar-cars.sql
rm easycar-clients.sql

echo "CREATE TABLE car(
   vin        varchar(128),
   model_id   int8,
   color      varchar(128),
   year       date,
   rate       float8
);" >> easycar-cars.sql

echo "CREATE TABLE client(
   client_id   serial PRIMARY KEY,
   firstName   varchar(128),
   lastName    varchar(128),
   gender      varchar(128),
   birthday    date
);" >> easycar-clients.sql

tail -n +2 ../../d/easycar-clients.csv | awk -F';' '{ printf "INSERT INTO client (firstName,lastName,gender,birthday) VALUES (\x27%s\x27,\x27%s\x27,\x27%s\x27,\x27%s\x27);",$1,$2,$3,$4;print ""}' >> easycar-clients.sql

psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "CREATE USER easycar WITH PASSWORD 'easycar';"
psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "CREATE DATABASE easycar;"
psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "GRANT ALL PRIVILEGES ON DATABASE easycar to easycar;"

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -f easycar-cars.sql
psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -f easycar-clients.sql
psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -f easycar-data-except-clients.sql

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -c "
DELETE
FROM
    client a
        USING client b
WHERE
    a.client_id < b.client_id
    AND a.firstName = b.firstName AND a.lastName = b.lastName AND a.birthday = b.birthday"

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -c "
ALTER TABLE car
ADD CONSTRAINT models FOREIGN KEY (model_id) REFERENCES model (model_id);"
