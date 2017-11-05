#!/bin/sh
for file in /etc/nginx/sites-enabled/*;
do
if [ ! -d /var/www/$file ]; then
  mkdir -p /var/www/$file
fi
domain=$(basename $file)
echo $domain
certbot certonly --standalone -w /var/www/$domain -d $domain
echo "0 0 * */2 * certbot renew --webroot -w /var/www/$domain -d $domain" >> mycron
done
crontab -r
crontab mycron
nginx -g "daemon off;"
