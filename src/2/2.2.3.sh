#!/bin/bash
psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "CREATE USER books WITH PASSWORD 'books';"
psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "CREATE DATABASE books;"
psql -h 192.168.3.245 -p 5432 -U postgres -W postgres -c "GRANT ALL PRIVILEGES ON DATABASE books to books;"

psql -h 192.168.3.245 -p 5432 -U books -W books -f books_schema.sql
psql -h 192.168.3.245 -p 5432 -U books -W books -f books_data.sql

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -c "
    SELECT a.name, count(*)
    FROM book_to_author AS b2a
    JOIN author AS a ON a.id = b2a.author_id
    GROUP BY a.name
    ORDER BY count(*) DESC
    LIMIT 5;
"
