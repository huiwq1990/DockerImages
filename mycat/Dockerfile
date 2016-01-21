
FROM centos:7
MAINTAINER Alex Wu
RUN yum -y install wget
RUN wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

#install java8
#ADD jdk-8u51-linux-x64.gz /usr/local
#RUN ln -s /usr/local/jdk1.8.0_51 /usr/local/java
#ENV JAVA_HOME /usr/local/java
#ENV PATH $PATH:$JAVA_HOME/bin
RUN yum -y install java-1.8.0-openjdk

#install tomcat
ADD apache-tomcat-7.0.67.tar.gz /usr/local
RUN ln -s /usr/local/apache-tomcat-7.0.67 /usr/local/tomcat

#install mysql
#ADD mariadb-5.5.36-linux-x86_64.tar.gz /usr/local
#RUN groupadd  -r  mysql && useradd -g mysql -r mysql
#RUN ln -s /usr/local/mariadb-5.5.36-linux-x86_64 /usr/local/mysql
#RUN chown -R mysql:mysql /usr/local/mysql/data
#RUN /usr/local/mysql/scripts/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data --basedir=/usr/local/mysql
RUN yum -y install mariadb-server mariadb
RUN /usr/bin/mysql_install_db --user=mysql --datadir=/var/lib/mysql

#install mycat
ADD Mycat-server-1.4-release-20151019230038-linux.tar.gz /opt
COPY ./schema.xml /opt/mycat/conf
ENV MYCAT_USER mycatuser
ENV MYCAT_PASS mycatpass
RUN sed -i 's/user name="test"/user name=\"'"$MYCAT_USER"'"/' /opt/mycat/conf/server.xml && sed -i 's/name="password">test/name="password">'"$MYCAT_PASS"'/' /opt/mycat/conf/server.xml

EXPOSE 8080 8066 9066
COPY ./start.sh .
ENTRYPOINT ./start.sh