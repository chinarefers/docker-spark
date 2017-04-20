# docker spark
# docker build -t docker-spark:1.0 .
FROM    openjdk:8-jre-alpine

MAINTAINER wangxiaolei(王小雷) “http://blog.csdn.net/dream_an https://github.com/wxiaolei”

RUN echo  "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.4/community/"  > /etc/apk/repositories
RUN echo  "https://mirrors.tuna.tsinghua.edu.cn/alpine/v3.4/main/"  >> /etc/apk/repositories
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
ARG DISTRO_NAME=docker-spark-2.1.0


ENV SPARK_USER=SPARK \
    SPARK_CONF_DIR=/conf \
    SPARK_DATA_DIR=/data \
    SPARK_LOG_DIR=/logs

# Add a user and make dirs
RUN set -x \
    && adduser -D "$SPARK_USER" \
    && mkdir -p "$SPARK_CONF_DIR" "$SPARK_DATA_DIR" "$SPARK_LOG_DIR" \
    && chown -R "$SPARK_USER:$SPARK_USER" "$SPARK_CONF_DIR" "$SPARK_DATA_DIR" "$SPARK_LOG_DIR"

CMD bash
