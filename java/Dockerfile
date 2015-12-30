
# Centos based container with Java and Tomcat
FROM centos:centos7

MAINTAINER huiwq1990

ENV PROGRAM_BASE /opt

# Install prepare infrastructure
RUN yum -y update && \
	yum -y install wget && \
	yum -y install tar 

# Prepare environment 
RUN yum -y install git && \
	yum clean all

# Install Oracle Java7

ENV JAVA_MAJOR=7u71 \
	JAVA_VERSION=b14
ENV JAVA_HOME /opt/java
RUN wget --no-verbose --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR}-${JAVA_VERSION}/jdk-${JAVA_MAJOR}-linux-x64.tar.gz && \
	tar -xvf jdk-${JAVA_MAJOR}-linux-x64.tar.gz && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}
ENV PATH $PATH:$JAVA_HOME/bin
