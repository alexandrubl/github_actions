FROM ubuntu:20.04

RUN apt-get update \
    apt-get install -y apache2 \
    apt-get install -y apache2-utils
    apt-get clean
    echo "Hello World" > /var/www/html/index.html
EXPOSE 80

CMD "apache2ctl", "-D" , "FOREGROUND"