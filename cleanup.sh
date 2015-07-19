#!/bin/bash

sleep 3

if [ -d /orientdb/databases/GratefulDeadConcerts ]; then
	# Drop example database
	/orientdb/bin/console.sh drop database remote:$ORIENTDB_PORT_2424_TCP_ADDR/GratefulDeadConcerts $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD plocal
	while [ $? -ne 0 ]; do
	    /orientdb/bin/console.sh drop database remote:$ORIENTDB_PORT_2424_TCP_ADDR/GratefulDeadConcerts $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD plocal
	done
else
	/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/bulktrade $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD
	while [ $? -ne 0 ]; do
		/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/bulktrade $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD
	done
fi

# Remove default reader and writer user
/orientdb/bin/console.sh connect remote:$ORIENTDB_PORT_2424_TCP_ADDR/bulktrade $ORIENTDB_ROOT_USER $ORIENTDB_ROOT_USER_PASSWORD\;\
						 UPDATE OUser SET password = \"$ORIENTDB_DB_USER_PASSWORD\" WHERE name = \"admin\"\; \
						 DELETE FROM OUser WHERE name = \"reader\"\; \
						 DELETE FROM OUser WHERE name = \"writer\"