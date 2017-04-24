FROM alpine:node-base
#hadoop:node-base
ENV LANG C.UTF-8
MAINTAINER wangxiaolei(王小雷) “http://blog.csdn.net/dream_an https://github.com/wxiaolei”
USER root
RUN set -x \
	&& apk add --no-cache \
						   openssh \
               openssl \
               rsync \
               openrc \
  && ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key \
  && ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key \
  && ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa \
  && cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

RUN rm -rf /etc/ssh/sshd_config
COPY sshd_config /etc/ssh/sshd_config 
COPY ssh_config /root/.ssh/config

RUN chmod 600 /root/.ssh/config \
  && chown root:root /root/.ssh/config



CMD ["rc-service sshd start"]
