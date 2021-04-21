FROM debian:10

#COPY ./jdk-8u191-linux-x64.tar.gz /d/jdk-8u191-linux-x64.tar.gz
COPY ./arthas-boot.jar /www/arthas-boot.jar

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
 	echo "deb http://mirrors.163.com/debian/ buster main contrib non-free" >> /etc/apt/sources.list && \
 	echo "deb http://mirrors.163.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list && \
 	echo "deb http://mirrors.163.com/debian-security/ buster/updates main contrib non-free" >> /etc/apt/sources.list && \
 	apt-get update && \
 	apt-get install net-tools && \
	cd /d/ && \
	wget https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz?AuthParam=1540881716_7bf2940cc75463d95d99b8a54fd377bd jdk-8u191-linux-x64.tar.gz && \
	tar -zxvf jdk-8u191-linux-x64.tar.gz && \
	cp -r jdk1.8.0_191 /usr/java && \
	rm -rf /d/

ENV JAVA_HOME=/usr/java
ENV JRE_HOME=/usr/java/jre
ENV CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
ENV PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

WORKDIR /www/
