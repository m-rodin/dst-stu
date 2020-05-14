#!/bin/bash

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -c "

CREATE OR REPLACE PROCEDURE drop_duplicates() LANGUAGE plpgsql AS \$\$
DECLARE
  original record;
  duplicate record;
  completed INT[] DEFAULT '{}';
BEGIN
  for original in (select * from client)
  loop
    for duplicate in (SELECT * FROM client WHERE client_id != original.client_id AND firstName = original.firstName AND lastName = original.lastName AND birthday = original.birthday AND  NOT client_id = ANY(completed))
    loop
      UPDATE rent SET client_id = original.client_id WHERE client_id = duplicate.client_id;
      DELETE FROM client WHERE client_id = duplicate.client_id;
    end loop;
    completed := array_append(completed, original.client_id);
  end loop;
END;
\$\$ ;"

psql -h 192.168.3.245 -p 5432 -U easycar -W easycar -c "CALL drop_duplicates()"
