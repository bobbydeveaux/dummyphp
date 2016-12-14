#!/bin/bash

export VERSION='1.0.6'

git add . 
git commit -m 'pushing release changes'
git tag -a $VERSION -m 'tagging release'
docker-compose build 

docker tag bobbydvo/lemp_php-fpm:latest  bobbydvo/lemp_php-fpm:$VERSION
docker tag bobbydvo/lemp_nginx:latest    bobbydvo/lemp_nginx:$VERSION

docker push bobbydvo/lemp_php-fpm:$VERSION
docker push bobbydvo/lemp_nginx:$VERSION

 ssh core@51.179.219.30 "date && hostname"