FROM huiwq1990/centos-java7

ENV ACTIVEMQ_VERSION 5.11.1
ENV ACTIVEMQ apache-activemq-${ACTIVEMQ_VERSION}

ENV ACTIVEMQ_HOME /opt/apache-activemq-${ACTIVEMQ_VERSION}

RUN \
    curl -O http://archive.apache.org/dist/activemq/${ACTIVEMQ_VERSION}/${ACTIVEMQ}-bin.tar.gz && \
    mkdir -p /opt && \
    tar xf $ACTIVEMQ-bin.tar.gz -C /opt/ && \
    rm $ACTIVEMQ-bin.tar.gz && \
    ln -s /opt/$ACTIVEMQ ${ACTIVEMQ_HOME} && \
    useradd -r -M -d ${ACTIVEMQ_HOME} activemq && \
    chown activemq:activemq /opt/$ACTIVEMQ -R

USER activemq

WORKDIR ${ACTIVEMQ_HOME}
EXPOSE 61616 8161

CMD ["/bin/bash", "-c", "bin/activemq start"]
#CMD ["/bin/bash", "-c", "bin/activemq console"]