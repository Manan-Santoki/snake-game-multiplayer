#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 83:83 raptor1702/snake-game
