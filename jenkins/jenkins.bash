export JENKINS_VERSION=2.32.1

docker stop jenkins
docker rm jenkins
docker pull jenkins:$JENKINS_VERSION

# docker run -d \
#   -name ci-jenkins \
#   -p 8080:8080 \
#   -p 50000:50000 \
#   -v $PWD/var/jenkins_home:/var/jenkins_home \
#   jenkins:$JENKINS_VERSION

docker run --name ci-jenkins -d -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home jenkins:$JENKINS_VERSION
# docker run --name ci-jenkins -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home jenkins:$JENKINS_VERSION

# docker exec -it ci-jenkins bash
# docker exec -u root -it ci-jenkins bash

# rm -rf $PWD/var/jenkins_home
# docker stop ci-jenkins
# docker rm -f ci-jenkins
# vim Dockerfile # update user passsword and id_rsa.pub key
# docker build -t ci-jenkins .
# docker run --name ci-jenkins -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home ci-jenkins

# docker stop ci-jenkins
# docker start ci-jenkins
