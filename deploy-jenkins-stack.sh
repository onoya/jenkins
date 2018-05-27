#!/bin/sh

DATE=$(date -I)

docker build . --no-cache -t onoya/jenkins:$DATE
docker tag onoya/jenkins:$DATE onoya/jenkins:lts
docker tag onoya/jenkins:$DATE onoya/jenkins:latest

docker push onoya/jenkins:$DATE
docker push onoya/jenkins:latest
docker push onoya/jenkins:lts

docker stack rm jenkins
sleep 15

docker stack deploy -c docker-compose.yml jenkins
