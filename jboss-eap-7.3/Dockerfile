FROM daggerok/jboss-eap-7.3:7.3.0-centos
LABEL MAINTAINER="daggerok https://github.com/daggerok/jboss-eap-7.3"
ENV JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
EXPOSE 5005
HEALTHCHECK --retries=33 \
            --timeout=3s \
            --interval=3s \
            --start-period=3s \
            CMD  wget -q --spider http://127.0.0.1:8080/my-service/health || exit 1
           #CMD curl -f http://127.0.0.1:8080/my-servicehealth           || exit 1
           #CMD test `netstat -ltnp | grep 9990 | wc -l` -ge 1           || exit 1
COPY --chown=jboss ./target/*.war ${JBOSS_HOME}/standalone/deployments/my-service.war
