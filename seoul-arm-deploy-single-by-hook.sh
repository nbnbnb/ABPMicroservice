#!/usr/bin/env bash

echo "Deploy Param01 $1" 
echo "Deploy Param02 $2" 

sudo git checkout master
sudo git pull

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:$2
docker compose -f aliyun-docker-compose.yml --env-file .env.arm up -d $1

