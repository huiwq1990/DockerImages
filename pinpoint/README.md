


docker pull dawidmalina/pinpoint-agent


## pinpoint releases °ü
https://github.com/naver/pinpoint/releases

for i in `seq 10000`; do        docker pull dawidmalina/pinpoint-web       ; done
docker pull dawidmalina/pinpoint-hbase

docker pull dawidmalina/pinpoint-agent

## ²éip
docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID}

https://github.com/dawidmalina/docker-pinpoint

  docker run -d --net=host -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 --name=pinpoint-hbase dawidmalinapinpoint-hbase

    docker run -d --net=host -e HBASE_HOST=127.0.0.1 -e HBASE_PORT=2181 -e COLLECTOR_TCP_PORT=9994 -e COLLECTOR_UDP_STAT_LISTEN_PORT=9995 -e COLLECTOR_UDP_SPAN_LISTEN_PORT=9996 -p 9994:9994 -p 9995:9995/udp -p 9996:9996/udp --name=pinpoint-collector  dawidmalina/pinpoint-collector

 docker run -d -p 8080:8080 --net=host -e HBASE_HOST=<HOST_IP> -e HBASE_PORT=2181 --name=pinpoint-web dawidmalina/pinpoint-web

 
 
## hbase

```

# DESCRIPTION       Pinpoint APM HBase (Data Storage)
# TO_BUILD          docker build -t pinpoint-hbase .
# TO_RUN            docker run -d --net=host -p 2181:2181 -p 60000:60000 -p 60010:60010 -p 60020:60020 -p 60030:60030 --name=pinpoint-hbase pinpoint-hbase

FROM java:8-jdk

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HBASE_VERSION=1.0.2
ENV HBASE_HOME=/opt/hbase/hbase-$HBASE_VERSION
ENV PINPOINT_VERSION=1.5.0

RUN mkdir -p /opt/hbase && \
    cd /opt/hbase && \
    curl -SL "http://apache.mirrors.pair.com/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz" -o hbase.tar.gz && \
    tar xfvz hbase.tar.gz && \
    rm -rf hbase.tar.gz

ADD hbase-site.xml /opt/hbase/hbase-$HBASE_VERSION/conf/hbase-site.xml

RUN curl -SL "https://raw.githubusercontent.com/naver/pinpoint/$PINPOINT_VERSION/scripts/hbase-create.hbase" -o /opt/hbase/hbase-create.hbase && \
    $HBASE_HOME/bin/start-hbase.sh && \
    sleep 10 && \
    $HBASE_HOME/bin/hbase shell /opt/hbase/hbase-create.hbase && \
    $HBASE_HOME/bin/stop-hbase.sh

VOLUME /home/pinpoint/hbase
VOLUME /home/pinpoint/zookeeper

# zookeeper
EXPOSE 2181
# HBase Master API port
EXPOSE 60000
# HBase Master Web UI
EXPOSE 60010
# Regionserver API port
EXPOSE 60020
# HBase Regionserver web UI
EXPOSE 60030

CMD /opt/hbase/hbase-$HBASE_VERSION/bin/hbase master start

```