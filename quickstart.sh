#!/bin/bash
set -e

if [ "$(docker ps -aq -f name=hyperdash-redis)" ]; then
  docker start hyperdash-redis
else
  docker run -d \
	--name hyperdash-redis \
	--restart unless-stopped \
	-p 6379:6379 \
	redis:latest
fi

if [ "$(docker ps -aq -f name=hyperdash-ranked)" ]; then
  docker start hyperdash-ranked
else
  docker run -d \
	--name hyperdash-ranked \
	--restart unless-stopped \
	-p 8000:8000 \
	hyperdash-ranked
fi