FROM debian:latest
MAINTAINER admin@gidgette.com
EXPOSE 8080

RUN mkdir /usr/local/xwiki
RUN mkdir /usr/local/java

RUN apt-get update
RUN apt-get install -y wget unzip

RUN mkdir /tmp/build
WORKDIR /tmp/build
RUN wget -O xwiki.zip http://download.forge.ow2.org/xwiki/xwiki-enterprise-jetty-hsqldb-9.1.1.zip
RUN unzip xwiki.zip
RUN rm -f xwiki.zip
RUN mv ./* xwiki
RUN mv xwiki /usr/local/

WORKDIR /usr/local/java
RUN wget -O java.tar.gz http://javadl.oracle.com/webapps/download/AutoDL?BundleId=218823_e9e7ea248e2c4826b92b3f075a80e441
RUN tar -zxf java.tar.gz
RUN rm -f java.tar.gz
RUN ln -s $(find /usr/local/java/*/bin/java) /usr/local/bin/java

RUN rm -rf /tmp/build
RUN apt-get remove -y wget unzip
RUN apt-get clean

CMD ["/bin/sh", "/usr/local/xwiki/start_xwiki.sh"]
