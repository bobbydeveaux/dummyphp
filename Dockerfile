FROM bobbydvo/ukc_php-fpm:latest

WORKDIR /srv
COPY . /srv/
WORKDIR /srv

RUN composer install

CMD ["/usr/bin/supervisord","-n","-c","/etc/supervisord.conf"]