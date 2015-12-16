#!/bin/bash

chown -R www-data:www-data /data/www/cafestory-server/
/usr/bin/redis-server /etc/redis/redis.conf
usr/sbin/php5-fpm -c /etc/php5/fpm/php-fpm.conf
/usr/sbin/nginx -c /etc/nginx/nginx.conf
