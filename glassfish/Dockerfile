FROM openjdk:8u151-jdk-alpine
MAINTAINER Maksim Kostromin https://github.com/daggerok/docker

ARG GLASSFISH_USER="glassfish5"
ARG GLASSFISH_FILE_ARG="glassfish-5.0.zip"
#ARG GLASSFISH_FILE_ARG="glassfish-5.0-web.zip"
ENV GLASSFISH_FILE=${GLASSFISH_FILE_ARG}
ENV GLASSFISH_USER_HOME="/home/${GLASSFISH_USER}"
ENV GLASSFISH_HOME="${GLASSFISH_USER_HOME}/${GLASSFISH_USER}"
ENV GLASSFISH_URL="http://download.oracle.com/glassfish/5.0/release/${GLASSFISH_FILE}"

RUN apk --no-cache --update add busybox-suid bash wget ca-certificates unzip \
 && rm -rf /var/cache/apk/* \
 && addgroup ${GLASSFISH_USER}-group \
 && adduser -h ${GLASSFISH_USER_HOME} -s /bin/bash -D -u 1025 ${GLASSFISH_USER} ${GLASSFISH_USER}-group
USER ${GLASSFISH_USER}
WORKDIR ${GLASSFISH_USER_HOME}

CMD /bin/bash
EXPOSE 8080
ENTRYPOINT /bin/bash ${GLASSFISH_HOME}/bin/asadmin restart-domain domain1 \
        && tail -f ${GLASSFISH_HOME}/glassfish/domains/domain1/logs/server.log

RUN wget ${GLASSFISH_URL} -O ${GLASSFISH_USER_HOME}/${GLASSFISH_FILE} \
 && unzip ${GLASSFISH_USER_HOME}/${GLASSFISH_FILE} -d ${GLASSFISH_USER_HOME} \
 && rm -rf ${GLASSFISH_USER_HOME}/${GLASSFISH_FILE}

## check all apps healthy (in current example we are expecting to have apps with /ui/ and /rest-api/ contexts deployed:
#HEALTHCHECK --interval=1s --timeout=3s --retries=30 \
# CMD wget -qS http://127.0.0.1:8080/rest-api/health \
#  && wget -qS http://127.0.0.1:8080/ui/ \
#  || exit 1

# deploy apps
COPY ./path/to/*.war ./path/to/another/*.war ${GLASSFISH_HOME}/glassfish/domains/domain1/autodeploy/
