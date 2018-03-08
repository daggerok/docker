FROM lwis/java5
MAINTAINER Maksim Kostormin https://github.com/daggerok
ARG JBOSS_VERSION_ARG="4.2.3.GA"
RUN apt-get update -y \
 && apt-get install -y --no-install-recommends wget unzip bash sudo openssh-client \
 && adduser -q --home /home/jboss --shell /bin/bash --uid 1025 --disabled-password jboss \
 && adduser jboss jboss \
 && echo "jboss ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && rm -rf /tmp/* \
 && apt-get remove openssh-client
WORKDIR /home/jboss
USER jboss
EXPOSE 8080
ENV JBOSS_VERSION="${JBOSS_VERSION_ARG}"
ENV JBOSS_HOME="/home/jboss/jboss-${JBOSS_VERSION}"
ENV JAVA_OPTS="$JAVA_OPTS \
-Djboss.bind.address=0.0.0.0 \
-Djboss.bind.address.management=0.0.0.0 \
-Djava.net.preferIPv4Stack=true \
-XX:+UnlockExperimentalVMOptions \
-XX:+UseCGroupMemoryLimitForHeap \
-XshowSettings:vm"
CMD /bin/bash
ENTRYPOINT /bin/bash ${JBOSS_HOME}/bin/run.sh
RUN wget --no-check-certificate \
             -O /tmp/jboss-${JBOSS_VERSION}.zip \
             https://sourceforge.net/projects/jboss/files/JBoss/JBoss-${JBOSS_VERSION}/jboss-${JBOSS_VERSION}.zip \
 && unzip -d /home/jboss /tmp/jboss-${JBOSS_VERSION}.zip \
 && rm -rf /tmp/*

############################################ USAGE ##############################################
# FROM daggerok/jboss4-java5                                                                    #
# COPY --chown=jboss target/*.war ${JBOSS_HOME}/default/deploy/                                 #
#################################################################################################

######################################## DEBUG USAGE ############################################
# FROM daggerok/jboss4-java5                                                                    #
# ENV JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" #
# EXPOSE 5005                                                                                   #
# COPY --chown=jboss target/*.war ${JBOSS_HOME}/default/deploy/                                 #
#################################################################################################
