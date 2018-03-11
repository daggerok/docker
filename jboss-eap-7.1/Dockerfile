# docker build -t daggerok/jboss:eap-7.1 .
# docker tag daggerok/jboss:eap-7.1 daggerok/jboss:eap-7.1-alpine
# docker tag daggerok/jboss:eap-7.1 daggerok/jboss:eap-7.1-latest
# docker push daggerok/jboss:eap-7.1

FROM openjdk:8u151-jdk-alpine
MAINTAINER Maksim Kostromin https://github.com/daggerok/docker

ARG JBOSS_USER="jboss-eap-7.1"
ARG DROPBOX_HASH_ARG="fx1jnh89w9mosjs"
ARG JBOSS_FILE_ARG="jboss-eap-7.1.0.zip"
ARG JBOSS_ADMIN_USER_ARG="admin"
ARG JBOSS_ADMIN_PASSWORD_ARG="Admin.123"

ENV DROPBOX_HASH=${DROPBOX_HASH_ARG} \
    JBOSS_FILE=${JBOSS_FILE_ARG}
ENV JBOSS_URL="https://www.dropbox.com/s/${DROPBOX_HASH}/${JBOSS_FILE}" \
    JBOSS_ADMIN_PASSWORD=${JBOSS_ADMIN_PASSWORD_ARG} \
    JBOSS_ADMIN_USER=${JBOSS_ADMIN_USER_ARG} \
    JBOSS_USER_HOME="/home/${JBOSS_USER}"
ENV JBOSS_HOME="${JBOSS_USER_HOME}/${JBOSS_USER}"

RUN apk --no-cache --update add busybox-suid bash wget ca-certificates unzip sudo openssh-client shadow \
 && addgroup ${JBOSS_USER}-group \
 && echo "${JBOSS_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && adduser -h ${JBOSS_USER_HOME} -s /bin/bash -D -u 1025 ${JBOSS_USER} ${JBOSS_USER}-group \
 && usermod -a -G wheel ${JBOSS_USER} \
 && apk --no-cache --no-network --purge del busybox-suid ca-certificates unzip shadow \
 && rm -rf /var/cache/apk/* /tmp/*

USER ${JBOSS_USER}
WORKDIR ${JBOSS_USER_HOME}

CMD /bin/bash
EXPOSE 8080 9990 8443
ENTRYPOINT /bin/bash ${JBOSS_HOME}/bin/standalone.sh

RUN wget ${JBOSS_URL} -O ${JBOSS_USER_HOME}/${JBOSS_FILE} \
 && unzip ${JBOSS_USER_HOME}/${JBOSS_FILE} -d ${JBOSS_USER_HOME} \
 && rm -rf ${JBOSS_USER_HOME}/${JBOSS_FILE} \
 && ${JBOSS_HOME}/bin/add-user.sh ${JBOSS_ADMIN_USER} ${JBOSS_ADMIN_PASSWORD} --silent \
 && echo "JAVA_OPTS=\"\$JAVA_OPTS -Djboss.bind.address=0.0.0.0 -Djboss.bind.address.management=0.0.0.0\"" >> ${JBOSS_HOME}/bin/standalone.conf

## check all apps healthy (in current example we are expecting to have apps with /ui/ and /rest-api/ contexts deployed:
#HEALTHCHECK --interval=1s --timeout=3s --retries=30 \
# CMD wget -q --spider http://127.0.0.1:8080/rest-api/health \
#  && wget -q --spider http://127.0.0.1:8080/ui/ \
#  || exit 1
#
## deploy apps
#COPY ./path/to/*.war ./path/to/another/*.war ${JBOSS_HOME}/standalone/deployments/
#COPY --chown=jboss-eap-7.1 ./path/to/*.war ./path/to/another/*.war ${JBOSS_HOME}/standalone/deployments/
