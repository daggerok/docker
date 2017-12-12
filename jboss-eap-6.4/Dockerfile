FROM openjdk:8u151-jdk-alpine
MAINTAINER Maksim Kostromin https://github.com/daggerok/docker

ARG JBOSS_USER="jboss-eap-6.4"
ARG JBOSS_FILE_ARG="jboss-eap-6.4.0.zip"
ARG JBOSS_ADMIN_USER_ARG="admin"
ARG JBOSS_ADMIN_PASSWORD_ARG="Admin.123"

ENV JBOSS_FILE=${JBOSS_FILE_ARG}
ENV JBOSS_URL="https://www.dropbox.com/s/xl2io9dhc6zxw9m/${JBOSS_FILE}"
ENV JBOSS_ADMIN_PASSWORD=${JBOSS_ADMIN_PASSWORD_ARG}
ENV JBOSS_ADMIN_USER=${JBOSS_ADMIN_USER_ARG}
ENV JBOSS_USER_HOME="/home/${JBOSS_USER}"
ENV JBOSS_HOME="${JBOSS_USER_HOME}/${JBOSS_USER}"

RUN apk --no-cache --update add busybox-suid bash wget ca-certificates unzip sudo openssh-client shadow \
 && rm -rf /var/cache/apk/* \
 && addgroup ${JBOSS_USER}-group \
 && echo "${JBOSS_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && adduser -h ${JBOSS_USER_HOME} -s /bin/bash -D -u 1025 ${JBOSS_USER} ${JBOSS_USER}-group \
 && usermod -a -G wheel ${JBOSS_USER}

USER ${JBOSS_USER}
WORKDIR ${JBOSS_USER_HOME}

CMD /bin/bash
EXPOSE 8080 9990
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

# deploy apps
COPY ./path/to/*.war ./path/to/another/*.war ${JBOSS_HOME}/standalone/deployments/
