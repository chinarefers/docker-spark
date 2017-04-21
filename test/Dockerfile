# docker HADOOP
# docker build -t docker-HADOOP:1.0 .
FROM    openjdk:8-jre-alpine

MAINTAINER wangxiaolei(王小雷) “http://blog.csdn.net/dream_an https://github.com/wxiaolei”

RUN echo  "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.5/community/"  > /etc/apk/repositories
RUN echo  "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.5/main/"  >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache \
        bash \
        su-exec \
        openssh \
        openrc  \
        rsync


RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

ADD ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config



ARG GPG_KEY=40935508C4A60BFA228526FB38C14CBE28E97588
ARG DISTRO_NAME=docker-hadoop-2.7.3

ENV HADOOP_HOME=/usr/local/hadoop-2.7.3




RUN mkdir -p $HADOOP_HOME
COPY hadoop-2.7.3 $HADOOP_HOME

RUN $HADOOP_HOME/bin/hdfs namenode -format
RUN $HADOOP_HOME/sbin/start-dfs.sh

EXPOSE 50010 50020 50070 50075 50090 8020 9000
# Mapred ports
EXPOSE 10020 19888
#Yarn ports
EXPOSE 8030 8031 8032 8033 8040 8042 8088
#Other ports
EXPOSE 49707 2122
