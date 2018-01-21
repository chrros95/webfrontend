#!/bin/sh
for file in /etc/nginx/sites-enabled/*;
do
domain=$(basename $file)
echo $domain
if [ ! -d /var/www/$domain ]; then
  mkdir -p /var/www/$domain
fi
certbot certonly --standalone -w /var/www/$domain -d $domain
echo "0 0 * */2 * certbot certonly --webroot -w /var/www/$domain -d $domain" >> mycron
done
crontab -r
crontab mycron
nginx -g "daemon off;"
