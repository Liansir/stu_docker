# Description: test image 
FROM busybox:latest 
#MAINTAINER: "LIANSIR"
LABEL maintainer="Liansir"
ENV DOC_ROOT=/data/web/html \
    WEB_SERVER_PACKAGE="apache-tomcat-9.0.20"

COPY index.html ${DOC_ROOT:-/data/web/html/}
COPY yum.repos.d /etc/yum.repos.d/
#ADD http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-9/v9.0.20/bin/apache-tomcat-9.0.20.tar.gz /usr/local/src/
WORKDIR /usr/local
ADD ${WEB_SERVER_PACKAGE}.tar.gz ./src/tomcat
VOLUME /data/mysql 
EXPOSE 80/tcp
