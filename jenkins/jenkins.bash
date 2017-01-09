export JENKINS_VERSION=2.32.1

docker stop jenkins
docker rm jenkins
docker pull jenkins:$JENKINS_VERSION

# docker run -d \
#   -name jenkins \
#   -p 2222:22 \
#   -p 8080:8080 \
#   -p 50000:50000 \
#   -v $PWD/jenkins/data:/var/jenkins_home \
#   jenkins:$JENKINS_VERSION

docker run --name jenkins --publish 22:2222 --publish 8080:8080 --publish 50000:50000 -v $PWD/jenkins/data:/var/jenkins_home jenkins:$JENKINS_VERSION

# docker exec -it jenkins bash
