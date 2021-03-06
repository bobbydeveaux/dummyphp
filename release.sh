#!/bin/bash

export DUMMY_VERSION='1.0.18'
export NGINX_VERSION='latest'

git add . 
git commit -m 'pushing release changes'

# This stuff to happen on CI server.
set -e
# git clone the repo.
git tag -a $DUMMY_VERSION -m 'tagging release'
git push 
git push --tags
docker-compose build 

docker tag bobbydvo/dummyapp_php-fpm:latest  bobbydvo/dummyapp_php-fpm:$DUMMY_VERSION
docker push bobbydvo/dummyapp_php-fpm:$DUMMY_VERSION
docker push bobbydvo/dummyapp_php-fpm:latest

ssh core@51.179.219.14 "docker service update --image bobbydvo/dummyapp_php-fpm:$DUMMY_VERSION php-fpm"
ssh core@51.179.219.14 "docker service update --image bobbydvo/ost_nginx:$NGINX_VERSION web"