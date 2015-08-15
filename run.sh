#!/bin/bash

ORIENTDB_HOME=/orientdb
export ORIENTDB_HOME

ORIENTDB_PORT_2424_TCP_ADDR=${ORIENTDB_PORT_2424_TCP_ADDR-localhost}
export ORIENTDB_PORT_2424_TCP_ADDR

ORIENTDB_DB=${ORIENTDB_DB-db}
QORIENTDB_DB=`echo $(printf '%q' $ORIENTDB_DB)`
export ORIENTDB_DB

ORIENTDB_DB_USER=${ORIENTDB_DB_USER-dbuser}
QORIENTDB_DB_USER=`echo $(printf '%q' $ORIENTDB_DB_USER)`
export ORIENTDB_DB_USER

ORIENTDB_DB_USER_PASSWORD=${ORIENTDB_DB_USER_PASSWORD-dbuser}
QORIENTDB_DB_USER_PASSWORD=`echo $(printf '%q' $ORIENTDB_DB_USER_PASSWORD)`
export ORIENTDB_DB_USER_PASSWORD

ORIENTDB_ROOT_USER=${ORIENTDB_ROOT_USER-root}
QORIENTDB_ROOT_USER=`echo $(printf '%q' $ORIENTDB_ROOT_USER)`
export ORIENTDB_ROOT_USER

ORIENTDB_ROOT_USER_PASSWORD=${ORIENTDB_ROOT_USER_PASSWORD-OrientDB}
QORIENTDB_ROOT_USER_PASSWORD=`echo $(printf '%q' $ORIENTDB_ROOT_USER_PASSWORD)`
export ORIENTDB_ROOT_USER_PASSWORD

sed -i "/<storages>/a <storage name=\"$QORIENTDB_DB\" path=\"plocal:/orientdb/databases/$QORIENTDB_DB\" userName=\"$QORIENTDB_DB_USER\" userPassword=\"$QORIENTDB_DB_USER_PASSWORD\" loaded-at-startup=\"true\" />" /orientdb/config/orientdb-server-config.xml
sed -i "/<users>/a <user name=\"$QORIENTDB_ROOT_USER\" resources=\"*\" password=\"$QORIENTDB_ROOT_USER_PASSWORD\"/><user resources=\"connect,server.listDatabases,server.dblist\" password=\"guest\" name=\"guest\"/>" /orientdb/config/orientdb-server-config.xml

/cleanup.sh&
/orientdb/bin/server.sh