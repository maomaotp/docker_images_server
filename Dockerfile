FROM ubuntu:14.04 
MAINTAINER liuqiang "404709954@qq.com"

VOLUME ["/home/ec2-user"] 

RUN apt-get update -y
RUN apt-get -y install nginx php5-fpm redis-server supervisor php5-curl

RUN mkdir -p /data/www

# 上传配置文件和代码库文件
ADD default /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/nginx.conf

#更新redis 配置文件
ADD redis.conf /etc/redis/redis.conf 
ADD start.sh /start.sh

ADD cafe.tar.gz /data/www

#RUN sed -e 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf
#RUN sed -e 's/;listen\.owner/listen.owner/' -i /etc/php5/fpm/pool.d/www.conf
#RUN sed -e 's/;listen\.group/listen.group/' -i /etc/php5/fpm/pool.d/www.conf
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80 

ENTRYPOINT ["/bin/bash", "/start.sh"]
