FROM oberthur/docker-ubuntu:14.04.3

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/
ENV MAVEN_HOME /usr/share/maven

ENV JAVA_6_HOME /usr/lib/jvm/java-6-oracle/
ENV JAVA_7_HOME /usr/lib/jvm/java-7-oracle/
ENV JAVA_8_HOME /usr/lib/jvm/java-8-oracle/

# get maven
RUN add-apt-repository -y ppa:webupd8team/java \
  && curl -fsSL http://119.255.9.12/mirrors.hust.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-3.3.9 /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
  && apt-get update \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  && apt-get install -y git net-tools oracle-java6-installer oracle-java7-installer oracle-java8-installer

RUN git clone https://github.com/naver/pinpoint.git /pinpoint


RUN mkdir -p /opt/hbase && \
    cd /opt/hbase && \
    curl -SL "http://apache.mirrors.pair.com/hbase/hbase-$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz" -o hbase.tar.gz && \
    tar xfvz hbase.tar.gz && \
    rm -rf hbase.tar.gz

ADD hbase-site.xml /opt/hbase/hbase-$HBASE_VERSION/conf/hbase-site.xml


WORKDIR /pinpoint
VOLUME [/pinpoint]

