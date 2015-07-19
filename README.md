# docker-orientdb
OrientDB dockerized!

### Installation

Pull image:

	docker pull bulktrade/orientdb
	
### Usage with docker-compose

	orientdb:
        image: bulktrade/orientdb
        ports:
            - 2424 # binary
            - 2480 # http
        environment:
            - ORIENTDB_DB=bulktrade
            - ORIENTDB_DB_USER=admin
            - ORIENTDB_DB_USER_PASSWORD=afsasf325246twsg
            - ORIENTDB_ROOT_USER=root
            - ORIENTDB_ROOT_USER_PASSWORD=dsfgdfh43z7453zuhgdfhjf
            - VIRTUAL_HOST=~^orientdb\..*
            - CERT_NAME=default
            - VIRTUAL_PORT=2480
