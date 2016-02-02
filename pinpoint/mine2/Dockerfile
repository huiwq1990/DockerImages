
# Centos based container with Java and Tomcat
FROM centos:centos6.6

MAINTAINER huiwq1990

ENV PROGRAM_BASE /opt

# Install prepare infrastructure
RUN yum -y update && \
	yum -y install wget && \
	yum -y install tar 

# Prepare environment 
RUN yum -y install git


WORKDIR /opt/

ENV JAVA_6_HOME /opt/jdk1.6.0_45
RUN mkdir -p ${JAVA_6_HOME}
RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin
RUN chmod +x jdk-6u45-linux-x64.bin
RUN sh ./jdk-6u45-linux-x64.bin
#RUN mv jdk1.6.0_45 ${JAVA_6_HOME}

# Install Oracle Java7

ENV JAVA_MAJOR=7u71 \
	JAVA_VERSION=b14
ENV JAVA_7_HOME /opt/jdk1.7.0_71
RUN mkdir -p ${JAVA_7_HOME}
RUN wget --no-verbose --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR}-${JAVA_VERSION}/jdk-${JAVA_MAJOR}-linux-x64.tar.gz && \
	tar -xvf jdk-${JAVA_MAJOR}-linux-x64.tar.gz 
#	mv jdk* ${JAVA_7_HOME}

## jdk1.8
ENV JAVA8_VERSION 8u31
ENV BUILD8_VERSION b13
ENV JAVA_8_HOME /opt/jdk1.8.0_31
RUN mkdir -p ${JAVA_8_HOME}

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/${JAVA8_VERSION}-${BUILD8_VERSION}/jdk-${JAVA8_VERSION}-linux-x64.tar.gz && \
	tar -xvf jdk-${JAVA8_VERSION}-linux-x64.tar.gz 
#	mv jdk* ${JAVA_8_HOME}

ENV PATH $PATH:$JAVA_7_HOME/bin
ENV JAVA_HOME $JAVA_7_HOME


	


WORKDIR /opt/
RUN wget http://mirror.apache-kr.org/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
RUN tar -zxf apache-maven-3.2.5-bin.tar.gz
ENV PATH $PATH:/opt/apache-maven-3.2.5/bin




## pinpoint

RUN git clone https://github.com/naver/pinpoint.git /pinpoint
WORKDIR /pinpoint
RUN git checkout tags/1.5.1
RUN mvn install -Dmaven.test.skip=true

#hbase
ENV HBASE_VERSION 1.0.2
WORKDIR quickstart/hbase
RUN wget http://mirror.bit.edu.cn/apache/hbase/hbase-${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz
#RUN wget http://archive.apache.org/dist/hbase/hbase-${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz 
RUN tar -zxf hbase-${HBASE_VERSION}-bin.tar.gz
#RUN rm hbase-${HBASE_VERSION}-bin.tar.gz
RUN ln -s hbase-${HBASE_VERSION} hbase
RUN cp ../conf/hbase/hbase-site.xml hbase-${HBASE_VERSION}/conf/
RUN chmod +x hbase-${HBASE_VERSION}/bin/start-hbase.sh



#ENV CATALINA_HOME /opt/tomcat 
#ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin:$CATALINA_HOME/scripts


# Install Tomcat
#RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz && \
#	tar -xvf apache-tomcat-7.0.67.tar.gz && \
#	rm apache-tomcat*.tar.gz && \
#	mv apache-tomcat* ${CATALINA_HOME} 

#RUN chmod +x ${CATALINA_HOME}/bin/*sh


ADD *.war /opt/
ADD web /opt/web
ADD collector /opt/collector
##ENV TOMCAT_FILE apache-tomcat-${TOMCAT_VERSION}.tar.gz
#ADD $TOMCAT_FILE ${PROGRAM_BASE}
##RUN tar -xvf apache-tomcat-7.0.67.tar.gz
#RUN cp -r ${PROGRAM_BASE}/apache-tomcat-7.0.67 ${PROGRAM_BASE}/collector


EXPOSE 8080
EXPOSE 28080
EXPOSE 28081
EXPOSE 28082




