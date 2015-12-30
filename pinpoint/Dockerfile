# docker build -t huiwq1990/pinpoint .

#  docker run -i -t huiwq1990/centos /bin/bash

FROM            ubuntu:14.04

MAINTAINER      Rob van Groenewoud <docker@robvangroenewoud.com>


RUN useradd pinpoint -m
WORKDIR /home/pinpoint

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update && apt-get -qq -y install wget

# install Oracle JDK 7
RUN apt-get -qq -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -qq -y install oracle-java7-installer
RUN rm -rf /var/cache/oracle-jdk7-installer

WORKDIR /data

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

RUN apt-get -qq -y install maven git



RUN git clone https://github.com/naver/pinpoint.git /pinpoint
WORKDIR /pinpoint
RUN git checkout tags/1.0.4
RUN mvn install -Dmaven.test.skip=true

WORKDIR quickstart/hbase
ADD http://archive.apache.org/dist/hbase/hbase-0.94.25/hbase-0.94.25.tar.gz ./
RUN tar -zxf hbase-0.94.25.tar.gz
RUN rm hbase-0.94.25.tar.gz
RUN ln -s hbase-0.94.25 hbase
RUN cp ../conf/hbase/hbase-site.xml hbase-0.94.25/conf/
RUN chmod +x hbase-0.94.25/bin/start-hbase.sh

WORKDIR /pinpoint
VOLUME [/pinpoint]
