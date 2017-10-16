#!/bin/sh
for file in *;
do 
certbot certonly --webroot -w /var/www/$file -d $file
done
nginx -g daemon off;
