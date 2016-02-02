FROM google/golang:1.4

RUN cd /goroot/src/ && GOOS=linux GOARCH=386 ./make.bash --no-clean

RUN apt-get update && apt-get install ruby vim-common -y

# Install Java for middleware testing
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update -y
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer -y

RUN wget http://apache-mirror.rbc.ru/pub/apache//commons/io/binaries/commons-io-2.4-bin.tar.gz -P /tmp
RUN tar xzf /tmp/commons-io-2.4-bin.tar.gz -C /tmp

WORKDIR /gopath/src/github.com/buger/gor/
ADD . /gopath/src/github.com/buger/gor/

#RUN javac -cp /tmp/commons-io-2.4/commons-io-2.4.jar ./examples/middleware/echo.java

RUN apt-get install graphviz -y

#RUN go get -u github.com/golang/lint/golint
#RUN go get


#RUN wget https://github.com/buger/gor/releases/download/v0.10.1/gor_0.10.1_x64.tar.gz

ADD ./gor_0.10.1_x64.tar.gz gor_0.10.1_x64.tar.gz
RUN tar -zxvf gor_0.10.1_x64.tar.gz

ENV CATALINA_HOME /opt/tomcat 
ENV TOMCAT_MAJOR=7 \
	TOMCAT_VERSION=7.0.67
RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	tar -xvf apache-tomcat-$TOMCAT_VERSION.tar.gz && \
	rm apache-tomcat*.tar.gz && \
	mv apache-tomcat* ${CATALINA_HOME} 

RUN chmod +x ${CATALINA_HOME}/bin/*sh

RUN apt-get -y install apache2
RUN /etc/init.d/apache2 restart