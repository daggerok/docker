export GITLAB_VERSION="8.15.3-ce.0"
export GITLAB_NAME="8.15.3-ce.0"

docker rm $GITLAB_NAME
docker pull gitlab/gitlab-ce:$GITLAB_VERSION

# docker run --detach \
#   --name $GITLAB_NAME \
#   --publish 2222:22 \
#   --publish 80:80 \
#   --publish 443:443 \
#   --volume $PWD/etc/gitlab:/etc/gitlab \
#   --volume $PWD/var/log/gitlab:/var/log/gitlab \
#   --volume $PWD/var/opt/gitlab:/var/opt/gitlab \
#   gitlab/gitlab-ce:$GITLAB_VERSION

docker run --detach --publish 443:443 --publish 80:80 --publish 22:22 --name gitlab --volume $PWD/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:$GITLAB_VERSION

# docker exec -it $GITLAB_NAME bash
# docker rm -f $GITLAB_NAME
