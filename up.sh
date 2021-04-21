#!/bin/bash

docker stop java-online
docker rm java-online
docker run --name  java-online -v ~/java/:/www -d -it owmao/java-online