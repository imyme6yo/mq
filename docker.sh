# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20200511
#!/bin/bash
DEBUG=$true
PROJECT="msca"
DIR="code"
SERVICE="$PROJECT-provision"

# Set PROJECT
if [ -n "$2" ] ; then
    PROJECT=$2
fi

echo $DEBUG
echo $DIR
echo $PROJECT
echo $SERVICE

# Set docker container name and image tag
IMAGE="$SERVICE:dev"
CONTAINER="$SERVICE-01"

# NETWORK="$PROJECT-network"

echo $IMAGE
echo $CONTAINER
# echo $NETWORK

# Clean previous docker images and containers
# stop docker container
docker stop $CONTAINER
# remove docker container
docker rm $CONTAINER
# remove docker image
docker rmi $IMAGE

# create docker network
# docker network create $NETWORK 
docker build --force-rm \
  --build-arg DEBUG=$DEBUG \
  --build-arg DIR=$DIR \
  --build-arg PROJECT=$PROJECT \
  --build-arg SERVICE=$SERVICE \
  -t $IMAGE -f ./Dockerfile.startup .

# run docker container
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock:rw \
  -v $(pwd):/$DIR \
  -p 9213:3000 \
  --name $CONTAINER $IMAGE sh /$DIR/start.sh