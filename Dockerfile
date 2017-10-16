FROM nginx:1.13.5

RUN apt-get update && apt-get install certbot \
    crontab -l > mycron && \
    echo "0 0 * */2 * certbot renew" >> mycron && \
    crontab mycron && \
    rm mycron
EXPOSE 80 443 8080 8443
VOLUME ["/var/www/html"]
VOLUME ["/etc/letsencrypt"]
VOLUME ["/etc/nginx"]

STOPSIGNAL SIGTERM

ENTRYPOINT ["nginx"]
CMD ["nginx", "-g", "daemon off;"]

