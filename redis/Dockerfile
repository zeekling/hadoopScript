FROM debian:10

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive 

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list ; sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -yqq \
      net-tools supervisor ruby rubygems locales gettext-base wget gcc make g++ build-essential libc6-dev tcl vim && \
    apt-get clean -yqq 

ARG redis_version=6.2

RUN wget -qO redis.tar.gz https://github.com/redis/redis/tarball/${redis_version} \
      && tar xfz redis.tar.gz -C / \
      && mv /redis-* /redis 


RUN (cd /redis && make && make install)

RUN mkdir /redis-conf && mkdir /redis-data && rm /redis.tar.gz
COPY redis-cluster.tmpl /redis-conf/redis-cluster.tmpl 
COPY redis.tmpl         /redis-conf/redis.tmpl 

# Add startup script 
COPY docker-entrypoint.sh /docker-entrypoint.sh 

COPY generate-supervisor-conf.sh /generate-supervisor-conf.sh 


RUN chmod 755 /docker-entrypoint.sh 

EXPOSE 7000 7001 7002 7003 7004 7005 7006 7007 5000 5001 5002 

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["redis-cluster"]
