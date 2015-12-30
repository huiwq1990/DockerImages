FROM            ubuntu:14.04

MAINTAINER      Rob van Groenewoud <docker@robvangroenewoud.com>

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

