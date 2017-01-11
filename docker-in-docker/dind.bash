export DOCKER_VERSION=1.11.2
export DIND_VERSION="$DOCKER_VERSION-dind"
export DOCKER_NAME="my-docker"
export DIND_NAME="my-dind"

docker rm -f $DIND_NAME

docker pull docker:$DIND_VERSION
docker run --name $DIND_NAME -it --privileged -d docker:$DIND_VERSION
docker logs $DIND_NAME
bash:
export dind="docker run --name $DOCKER_NAME -it --rm --link $DIND_NAME:docker docker:$DOCKER_VERSION"
# fish:
# set dind "docker run --name $DOCKER_NAME -it --rm --link $DIND_NAME:docker docker:$DOCKER_VERSION"

eval $dind version
# eval $dind sh
eval $dind info

docker stop $DIND_NAME
docker start $DIND_NAME

docker rm -f $DIND_NAME
docker run --name $DIND_NAME -it --privileged -d docker:$DIND_VERSION --storage-driver=vfs
eval $dind info
