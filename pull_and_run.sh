#!/usr/bin/env bash

profile=${1}
sudo git pull

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-authserver-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d auth-server

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-backendadminapp-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d backend-admin-app

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-publicwebsite-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d public-website

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-identityservice-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d identity-service

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-tenantmanagementservice-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d tenant-management-service

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-bloggingservice-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d blogging-service 

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-productservice-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d product-service 

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-internalgateway-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d internal-gateway 

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-backendadminappgateway-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d backend-admin-app-gateway 

docker pull registry.cn-hangzhou.aliyuncs.com/zhangjj/demo:abp-publicwebsitegateway-host
docker-compose -f aliyun-docker-compose.yml --env-file .env.${profile} up -d public-website-gateway 

docker image prune -f