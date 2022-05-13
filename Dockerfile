FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN runcate -s0 /tmp/preseed.cfg; \
    echo "tzdata tzdata/Areas select Europe" >> /tmp/preseed.cfg; \
    echo "tzdata tzdata/Zones/Europe select Berlin" >> /tmp/preseed.cfg; \
    debconf-set-selections /tmp/preseed.cfg && \
    rm -f /etc/timezone /etc/localtime && \
    apt-get update && \
    apt-get install -y apache2 && \
    apt-get install -y apache2-utils && \
    apt-get clean && \
    echo "Hello World" > /var/www/html/index.html

COPY httpd-foreground /usr/local/bin/

EXPOSE 80

CMD ["apache2","-DFOREGROUND"]
#CMD "/usr/sbin/httpd", "-D", "FOREGROUND"
