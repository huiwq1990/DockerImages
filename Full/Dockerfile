
# Centos based container with Java and Tomcat
FROM centos:centos7
MAINTAINER huiwq1990

# Install prepare infrastructure
RUN yum -y update && \
	yum -y install wget && \
	yum -y install tar 

# Prepare environment 
RUN yum -y install git && \
	yum clean all

# Install Oracle Java7
ENV JAVA_HOME /opt/java
ENV JAVA_MAJOR=7 \
	JAVA_VERSION=b14
RUN wget --no-verbose --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
	http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz && \
	tar -xvf jdk-7u71-linux-x64.tar.gz && \
	rm jdk*.tar.gz && \
	mv jdk* ${JAVA_HOME}
ENV PATH $PATH:$JAVA_HOME/bin

# Install maven 3.2.2
ENV MAVEN_HOME=/opt/maven \
	MAVEN_VERSION=3.2.5
#RUN wget -O /tmp/apache-maven-${MAVEN_VERSION}.tar.gz \
#	http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz
# verify checksum
# RUN echo "87e5cc81bc4ab9b83986b3e77e6b3095 /tmp/apache-maven-${MAVEN_VERSION}.tar.gz" | md5sum -c
#RUN tar -xvf /tmp/apache-maven-3.2.5.tar.gz && mv apache-maven* /opt
#RUN tar -xvf /tmp/apache-maven-3.2.5.tar.gz -C ${MAVEN_HOME}
RUN wget http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
	tar -xvf apache-maven-3.2.5.tar.gz && \
	rm apache-maven-*.tar.gz && \
	mv apache-maven-* /opt
ENV PATH $PATH:${MAVEN_HOME}/bin


# Install Tomcat Start
ENV CATALINA_HOME /opt/tomcat
ENV TOMCAT_MAJOR=8 \
	TOMCAT_VERSION=8.0.20
RUN wget http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR}/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME}

RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Create Tomcat admin user
ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh
ENV PATH $PATH:$CATALINA_HOME/bin:$CATALINA_HOME/scripts

# Create tomcat user
RUN groupadd -r tomcat && \
	useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
	chown -R tomcat:tomcat ${CATALINA_HOME}

WORKDIR /opt/tomcat

EXPOSE 8080
EXPOSE 8009

USER tomcat
CMD ["tomcat.sh"]
## Install Tomcat End
