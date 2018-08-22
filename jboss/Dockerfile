## eap:
FROM daggerok/jboss:eap-7.1-eap

## wildfly:
#FROM daggerok/jboss:wildfly-13.0.0.Final

## remote debug (JetBrains IDEA remote debug zero-configuration):
ENV JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 "
EXPOSE 5005

## health (check assuming '/health' endpoint implemented):
HEALTHCHECK --timeout=2s --retries=22 \
        CMD wget -q --spider http://127.0.0.1:8080/my-service/health \
         || exit 1

## multi-deployments:
#COPY ./build/libs/*.war ./target/*.war ${JBOSS_HOME}/standalone/deployments/

## single app deployment:
ADD ./build/libs/*.war ${JBOSS_HOME}/standalone/deployments/my-service.war
