
# Centos based container with Java and Tomcat
FROM huiwq1990/centos-java7

MAINTAINER huiwq1990

ENV PROGRAM_BASE /opt

# Install prepare infrastructure
RUN yum -y update && \
	yum -y install wget && \
	yum -y install tar && \
	yum -y install telnet
	
RUN yum install -y mysql


# Prepare environment 
RUN yum -y install git && \
	yum clean all

# Install Maven

ENV	MAVEN_VERSION=3.2.5
ENV MAVEN_HOME=${PROGRAM_BASE}/apache-maven-${MAVEN_VERSION}
RUN curl -O http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
	tar -xvf apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
	rm apache-maven-*.tar.gz && \
	mv apache-maven-* ${PROGRAM_BASE}
ENV PATH $PATH:${MAVEN_HOME}/bin


# Install Tomcat Start
ENV CATALINA_HOME /opt/tomcat
ENV TOMCAT_MAJOR=8 \
	TOMCAT_VERSION=8.0.20
RUN curl -O http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
	tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME}

RUN chmod +x ${CATALINA_HOME}/bin/*sh
RUN ${CATALINA_HOME}/bin/startup.sh


## zookeeper start
ENV ZOOKEEPER_VERSION=3.4.6
ENV ZOOKEEPER_HOME=/opt/zookeeper
RUN curl -O http://apache.mirror.digitalpacific.com.au/zookeeper/stable/zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
			tar xf zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt && \
			mv /opt/zookeeper-${ZOOKEEPER_VERSION} ${ZOOKEEPER_HOME}

COPY docker-zookeeper-entrypoint.sh /docker-zookeeper-entrypoint.sh
#ENTRYPOINT ["/docker-zookeeper-entrypoint.sh"]
#RUN chmod +x /docker-zookeeper-entrypoint.sh

#VOLUME /data/zookeeper

#WORKDIR /opt/zookeeper/bin
#RUN ./zkServer.sh start-foreground
# client port=2181, connect to leader=2888, leader election=3888
EXPOSE 2181 2888 3888
#CMD ["./zkServer.sh", "start-foreground"]
## end zookeeper


RUN groupadd -r redis && useradd -r -g redis redis

ENV REDIS_VERSION 3.0.3
ENV REDIS_DOWNLOAD_URL http://download.redis.io/releases/redis-3.0.3.tar.gz
ENV REDIS_DOWNLOAD_SHA256 1d08fa665b16d0950274dfbd47fbbcf3485e43e901021338640a0334666e9da5

ADD redis.conf-sane-defaults.patch /tmp/

RUN buildDeps='gcc make glibc-devel patch' \
  && set -x \
  && yum install -y $buildDeps \
  && mkdir -p /usr/src/redis \
  && curl -sSL "$REDIS_DOWNLOAD_URL" -o redis.tar.gz \
  && echo "$REDIS_DOWNLOAD_SHA256 *redis.tar.gz" | sha256sum -c - \
  && tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1 \
  && rm redis.tar.gz \
  && patch -p1 -i /tmp/redis.conf-sane-defaults.patch /usr/src/redis/redis.conf \
  && rm /tmp/redis.conf-sane-defaults.patch \
  && make -C /usr/src/redis \
  && make -C /usr/src/redis PREFIX=/usr install \
  && cp /usr/src/redis/redis.conf /etc/redis.conf \
  && rm -r /usr/src/redis \
  && yum remove -y $buildDeps \
  && yum clean -y all

# Add systemd support
ADD redis.service /etc/systemd/system/redis.service
RUN systemctl enable redis.service

#VOLUME /var/lib/redis
#WORKDIR /var/lib/redis

EXPOSE 6379

CMD ["/bin/ls"]