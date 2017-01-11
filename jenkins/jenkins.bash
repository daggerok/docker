export JENKINS_VERSION=2.32.1
export JENKINS_NAME=my-jenkins

docker stop $JENKINS_NAME
docker rm $JENKINS_NAME
docker pull jenkins:$JENKINS_VERSION

# docker run -d \
#   -name $JENKINS_NAME \
#   -p 8080:8080 \
#   -p 50000:50000 \
#   -v $PWD/var/jenkins_home:/var/jenkins_home \
#   jenkins:$JENKINS_VERSION

docker run --name $JENKINS_NAME -d -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home jenkins:$JENKINS_VERSION
# docker run --name $JENKINS_NAME -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home jenkins:$JENKINS_VERSION

# docker exec -it $JENKINS_NAME bash
# docker exec -u root -it $JENKINS_NAME bash

# rm -rf $PWD/var/jenkins_home
# docker stop $JENKINS_NAME
# docker rm -f $JENKINS_NAME
# vim Dockerfile # update user passsword and id_rsa.pub key
# docker build -t $JENKINS_NAME .
# docker run --name $JENKINS_NAME -p 8080:8080 -p 50000:50000 -v $PWD/var/jenkins_home:/var/jenkins_home $JENKINS_NAME

# docker stop $JENKINS_NAME
# docker start $JENKINS_NAME
