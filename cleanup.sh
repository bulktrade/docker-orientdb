#!/bin/bash

sleep 3

/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/$ORIENTDB_DB $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD
while [ $? -ne 0 ]; do
	/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/$ORIENTDB_DB $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD
done

# Remove default reader and writer user
/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/$ORIENTDB_DB $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD\;\
						 UPDATE OUser SET password = \"$ORIENTDB_DB_USER_PASSWORD\" WHERE name = \"admin\"\; \
						 DELETE FROM OUser WHERE name = \"reader\"\; \
						 DELETE FROM OUser WHERE name = \"writer\"