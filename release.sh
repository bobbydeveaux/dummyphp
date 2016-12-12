#!/bin/bash

export VERSION='1.0.0'

git add . 
git commit -m 'pushing release changes'
git tag -a $VERSION -m 'tagging release'
docker-compose build 

docker commit 1c582911c34d bobbydvo/lemp_php-fpm:$VERSION
docker commit 1c582911c34d bobbydvo/lemp_php-fpm:latest

docker push bobbydvo/lemp_php-fpm:$VERSION
docker push bobbydvo/lemp_php-fpm:latest

 #ssh core@51.179.219.86 "date && hostname"