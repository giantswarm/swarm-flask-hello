#!/bin/bash

SERVICE=$1 
IMAGE=$2
DOMAIN=$3
PORT=$4

# build swarm.json
sed -e "
s,%SERVICE%,$SERVICE,g;
s,%IMAGE%,$IMAGE,g;
s,%DOMAIN%,$DOMAIN,g;
s,%PORT%,$PORT,g;
" swarm.json.template > swarm.json

# build swarm-api.json
sed -e "
s,%SERVICE%,$SERVICE,g;
s,%IMAGE%,$IMAGE,g;
s,%DOMAIN%,$DOMAIN,g;
s,%PORT%,$PORT,g;
" swarm-api.json.template > swarm-api.json
