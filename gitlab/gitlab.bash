export GITLAB_VERSION="8.15.3-ce.0"

docker rm gitlab
docker pull gitlab/gitlab-ce:$GITLAB_VERSION

# docker run --detach \
#   --name gitlab \
#   --publish 2222:22 \
#   --publish 80:80 \
#   --publish 443:443 \
#   --volume $PWD/gitlab/config:/etc/gitlab \
#   --volume $PWD/gitlab/logs:/var/log/gitlab \
#   --volume $PWD/gitlab/data:/var/opt/gitlab \
#   gitlab/gitlab-ce:$GITLAB_VERSION

docker run --detach --publish 443:443 --publish 80:80 --publish 22:22 --name gitlab --volume $PWD/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce:$GITLAB_VERSION

# docker exec -it gitlab bash
