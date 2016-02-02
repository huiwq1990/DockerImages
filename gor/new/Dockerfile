
# Centos based container with Java and Tomcat
FROM centos:centos6.6
MAINTAINER huiwq1990

# Install prepare infrastructure
RUN yum -y update && \
	yum -y install wget && \
	yum -y install tar 

	
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install golang

WORKDIR /opt

# Prepare environment 
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Install Oracle Java7
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && \
	tar -xvf jdk-7u71-linux-x64.tar.gz && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}
	
	

RUN wget https://github.com/buger/gor/releases/download/v0.10.1/gor_0.10.1_x64.tar.gz

RUN tar -zxvf gor_0.10.1_x64.tar.gz

ENV CATALINA_HOME /opt/tomcat 
ENV TOMCAT_MAJOR=7 \
	TOMCAT_VERSION=7.0.67
RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

RUN yum -y install gcc gcc-c++ make libtool zlib zlib-devel openssl openssl-devel pcre pcre-devel

ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum -y install nginx

RUN /etc/init.d/nginx start

EXPOSE 8080
EXPOSE 80