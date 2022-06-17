###
# docker build --no-cache -t daggerok/h2 -f ./h2/Dockerfile .
# docker run --rm -it -p 8082:8082 -p 9092:9092 --name h2 -v /tmp/h2/data:/home/h2/data daggerok/h2
# mkdir -p /tmp/h2/data ; docker run --rm -d -p 8082:8082 -p 9092:9092 --name h2 -v /tmp/h2/data:/home/h2/data \
#   --health-start-period=1s --health-retries=3 --health-interval=3s --health-timeout=3s \
#   --health-cmd='curl 127.0.0.1:8082 || exit 1' \
#   daggerok/h2
# docker stop h2
###
FROM openjdk:8u332-jre-buster

ARG H2_VERSION_ARG='2.1.214'
ARG H2_USERNANE_ARG='h2'
ARG H2_TCP_PORT_ARG='9092'
ARG H2_WEB_PORT_ARG='8082'

ENV H2_VERSION=${H2_VERSION_ARG} \
    H2_USERNANE=${H2_USERNANE_ARG} \
    H2_TCP_PORT=${H2_TCP_PORT_ARG} \
    H2_WEB_PORT=${H2_WEB_PORT_ARG}

ENV H2_USER_HOME="/home/${H2_USERNANE_ARG}" \
    H2_URL="https://repo1.maven.org/maven2/com/h2database/h2/${H2_VERSION}/h2-${H2_VERSION}.jar"

ENV H2_JAR="${H2_USER_HOME}/h2-${H2_VERSION}.jar" \
    H2_DATA="${H2_USER_HOME}/data" \
    PATH="${PATH}:${JAVA_HOME}/bin"

RUN apt-get --no-install-recommends -yqq update                             \
 && apt-get --no-install-recommends -yqq install wget sudo                  \
 && echo "${H2_USERNANE} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers           \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers             \
 && adduser --home /home/${H2_USERNANE} --shell /bin/bash ${H2_USERNANE}    \
 && wget ${H2_URL} -O ${H2_JAR}                                             \
 && mkdir -p  ${H2_DATA}                                                    \
 && chown -Rcv ${H2_USERNANE}:${H2_USERNANE} ${H2_JAR} ${H2_DATA}

HEALTHCHECK --start-period=1s --retries=3 --interval=3s --timeout=3s \
        CMD ( curl --silent --fail "127.0.0.1:${H2_WEB_PORT}" ) || exit 1

USER ${H2_USERNANE}
WORKDIR ${H2_USER_HOME}
VOLUME ${H2_USER_HOME}/data

ARG JAVA_OPTS_ARGS=' \
 -Djava.net.preferIPv4Stack=true \
 -XX:+UnlockExperimentalVMOptions \
 -XX:+UseCGroupMemoryLimitForHeap \
 -XshowSettings:vm '
ENV JAVA_OPTS="${JAVA_OPTS} ${JAVA_OPTS_ARGS}"

EXPOSE ${H2_TCP_PORT} ${H2_WEB_PORT}
ENTRYPOINT ["/bin/bash", "-c"]
CMD [" \
mkdir -p ${H2_DATA} \
  && java -cp ./*.jar org.h2.tools.Server \
        -tcp -tcpAllowOthers -tcpPort ${H2_TCP_PORT} \
        -web -webAllowOthers -webPort ${H2_WEB_PORT} \
        -trace -ifNotExists -baseDir ${H2_DATA} \
"]
