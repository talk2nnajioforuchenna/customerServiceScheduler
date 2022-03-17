#!/bin/bash
app="csscheduler"

docker build -t ${app} .

if docker ps | awk -v app="app" 'NR>1{  ($(NF) == app )  }'; then
    docker stop "$app" && docker rm -f "$app"
fi

docker run -d -p 5001:5000 \
    --name=${app} \
    ${app}