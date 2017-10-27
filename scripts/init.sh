#!/bin/sh
cd /etc/nginx/sites-enabled
for file in *;
do
if [ ! -d /var/www/$file ]; then
  mkdir -p /var/www/$file
fi
certbot certonly --webroot -w /var/www/$file -d $file
done
nginx -g "daemon off;"
