#!/bin/bash

# build image
docker build -t tjaung/cs6620-app:v1.0 .

# run container
docker run -p 5000:5000 tjaung/cs6620-app:v1.0
