#!/bin/bash

set -e

echo "START USER DATA"

dnf update -y

dnf install -y docker

systemctl start docker
systemctl enable docker

docker run -d \
  --name nginx \
  --restart always \
  -p 80:80 \
  nginx

echo "END USER DATA"