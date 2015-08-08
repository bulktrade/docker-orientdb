FROM java:8
RUN apt-get update && apt-get upgrade -y && apt-get install -y wget

WORKDIR /

RUN wget "http://orientdb.com/download.php?email=unknown@unknown.com&file=orientdb-community-2.1.0.tar.gz&os=linux" -O orientdb-community-2.1.0.tar.gz &&\
    tar -zxvf orientdb-community-2.1.0.tar.gz && \
    mv orientdb-community-2.1.0 orientdb && \
    rm -rf orientdb-community-2.1.0.tar.gz && \
    mkdir -p /orientdb/backup

RUN rm -rf /var/lib/apt/lists/*
VOLUME ["/orientdb/backup", "/orientdb/databases", "/orientdb/config"]

EXPOSE 2424 2480

WORKDIR /orientdb

ADD run.sh /run.sh
ADD cleanup.sh /cleanup.sh
CMD ["/run.sh"]
