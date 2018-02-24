FROM openjdk:8u151-jre-alpine3.7
MAINTAINER Maksim Kostromin https://github.com/daggerok
RUN apk --no-cache --update add busybox-suid bash curl unzip sudo openssh-client shadow wget \
 && adduser -h /home/appuser -s /bin/bash -D -u 1025 appuser wheel \
 && echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
                  "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" \
         -O /tmp/jce_policy-8.zip \
 && unzip -o /tmp/jce_policy-8.zip -d /tmp \
 && mv -f ${JAVA_HOME}/lib/security ${JAVA_HOME}/lib/backup-security \
 && mv -f /tmp/UnlimitedJCEPolicyJDK8 ${JAVA_HOME}/lib/security \
 && wget -O /home/appuser/kafka.jar https://raw.githubusercontent.com/daggerok/embedded-kafka/mvn-repo/embedded-kafka-0.0.3-all.jar \
 && chown -R appuser:wheel /home/appuser/kafka.jar \
 && apk del busybox-suid unzip openssh-client shadow wget \
 && rm -rf /var/cache/apk/* /tmp/*
USER appuser
WORKDIR /home/appuser
VOLUME /home/appuser
CMD /bin/bash
ARG ZOOKEEPER_PORT_ARG="2181"
ARG ZOOKEEPER_DIR_ARG=/home/appuser
ARG KAFKA_PORT_ARG="9092"
ARG KAFKA_TOPICS_ARG="\
topic1,topic2,topic3"
ARG HTTP_PORT_ARG="8080"
ARG HTTP_CONTEXT_ARG="/"
ENV ZOOKEEPER_PORT="${ZOOKEEPER_PORT_ARG}" \
    ZOOKEEPER_DIR="${ZOOKEEPER_DIR_ARG}" \
    KAFKA_PORT="${KAFKA_PORT_ARG}" \
    KAFKA_TOPICS="${KAFKA_TOPICS_ARG}" \
    HTTP_PORT="${HTTP_PORT_ARG}" \
    HTTP_CONTEXT="${HTTP_CONTEXT_ARG}"
ENTRYPOINT java -Djava.net.preferIPv4Stack=true \
                -XX:+UnlockExperimentalVMOptions \
                -XX:+UseCGroupMemoryLimitForHeap \
                -XshowSettings:vm \
                -jar /home/appuser/kafka.jar \
                        --zookeeperPort="${ZOOKEEPER_PORT}" \
                        --zookeeperDir="${ZOOKEEPER_DIR}" \
                        --kafkaPort="${KAFKA_PORT}" \
                        --kafkaTopics="${KAFKA_TOPICS}" \
                        --httpPort="${HTTP_PORT}" \
                        --httpContext="${HTTP_CONTEXT}"
EXPOSE ${ZOOKEEPER_PORT} ${KAFKA_PORT} ${HTTP_PORT}
HEALTHCHECK --timeout=2s \
            --retries=22 \
            CMD curl -f "http://127.0.0.1:${HTTP_PORT}${HTTP_CONTEXT}" || exit 1

### you can use next docker-compose ###
#
# version: "2.1"
# services:
#   kafka-app:
#     image: daggerok/kafka:v9
#     environment:
#       ZOOKEEPER_PORT: 2181
#       ZOOKEEPER_DIR: ./zk
#       KAFKA_PORT: 9092
#       KAFKA_TOPICS: topic1,topic2
#       HTTP_PORT: 8080
#       HTTP_CONTEXT: /
#     volumes: ["kafka-app-data:/home"]
#     ports: ["8080:8080"]
#     networks: [backing-services]
# volumes:
#   kafka-app-data: {}
# networks:
#   backing-services:
#     driver: bridge
#
#######################################
