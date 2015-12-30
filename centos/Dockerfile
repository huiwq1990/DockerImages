
# docker build -t huiwq1990/centos .

#  docker run -i -t huiwq1990/centos /bin/bash

# Python install https://github.com/kalefranz/dockerfiles/blob/master/centos/Dockerfile
#
#
#
#


FROM centos:6.6

# add epel repo
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

RUN yum -y update 

# install base packages
RUN yum -y groupinstall "Development Tools"
RUN yum -y install erlang gcc gcc-c++ kernel-devel-`uname -r` make perl sqlite-devel
RUN yum -y install bzip2 bzip2-devel zlib-devel
RUN yum -y install ncurses-devel readline-devel tk-devel
RUN yum -y install net-tools nfs-utils openssl-devel
RUN yum -y install git screen tmux wget zsh tar

RUN yum -y install mlocate
RUN updatedb


# install python 2.7
#RUN /usr/bin/curl -s 'http://www.python.org/download/releases/' | gawk 'match($0, /The current production versions are <strong>([0-9.]+)<\/strong>/, ary) {print ary[1]}' > PYTHON_VERSION
ENV PYTHON_VERSION 2.7.11
ENV VERSION 2.7.11
RUN wget -O Python-${VERSION}.tar.xz http://python.org/ftp/python/${VERSION}/Python-${VERSION}.tar.xz && tar -xf Python-${VERSION}.tar.xz
RUN cd Python-${VERSION} && ./configure --prefix=/usr/local && make && make altinstall
RUN rm -rf Python*
RUN ln -s /usr/local/bin/python2.7 /usr/local/bin/python

RUN yum -y install python-pip