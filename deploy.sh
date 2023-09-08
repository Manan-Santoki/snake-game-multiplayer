#!/bin/bash
docker pull snake-game
docker run -d -p 83:83 snake-game:latest
