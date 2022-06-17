# docker image:https://github.com/daggerok/docker/actions/workflows/h2.yml/badge.svg["h2", link=https://github.com/daggerok/docker/actions/workflows/h2.yml]

collection of docker / docker-compose files for:

- link:h2/[H2 database 2.1.214 openjdk:8u332-jre-buster]
+
[source,bash]
----
docker build --no-cache -t daggerok/h2 -f ./h2/Dockerfile .
docker run --rm -it -p 8082:8082 -p 9092:9092 --name h2 -v /tmp/h2/data:/home/h2/data daggerok/h2
# and use next JDBC url: jdbc:h2:tcp://127.0.0.1;9092/test:Mode=MySQL
----
- link:alpine-openstack-terraform/[Alpine + OpenStack + Terraform]
- link:cassandra/[cassandra]
- link:docker-in-docker/[docker in docker (dind)]
- link:gitlab/[gitlab]
- link:glassfish/[glassfish]
- link:gradle/[gradle built app]
- link:jboss/[JBoss EAP / WildFly]
- link:jenkins/[jenkins]
- link:maven/[maven built app]
- link:mercurial/[mercurial web server]
- link:kong/[kong]
- link:mongo/[mongo]
- link:mysql/[mysql]
- link:mysql-phpmyadmin/[MySQL + phpMyAdmin]
- link:nginx/[nginx]
- link:alpine-openstack-terraform/[openstack]
- link:oracle/[oracle]
- link:postgres/[postgres]
- link:rabbitmq-mongo/[rabbitmq-mongo]
- link:rabbitmq/[rabbitmq]
- link:redis/[redis]
- link:sonarqube/[sonarqube]
- link:spring-boot/[spring-boot (java jar)]
- link:alpine-openstack-terraform/[terraform]
- etc...
