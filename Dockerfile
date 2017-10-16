FROM nginx:1.13.5

COPY scripts/init.sh /opt/init.sh
RUN apt-get update && apt-get install -y certbot cron && \
    echo '0 0 * */2 * certbot renew' >> mycron && \
    crontab mycron && \
    rm mycron
EXPOSE 80 443 8080 8443
VOLUME ["/var/www/html"]
VOLUME ["/etc/letsencrypt"]
VOLUME ["/etc/nginx"]

STOPSIGNAL SIGTERM

ENTRYPOINT ["/opt/init.sh"]
