FROM bobbydvo/ost_php-fpm:latest

WORKDIR /srv
COPY . /srv/
WORKDIR /srv

RUN composer install

CMD [ "php-fpm", "-c", "/usr/local/etc/php/php-dev.ini" ]