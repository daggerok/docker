FROM openjdk:8u151-jdk-alpine
MAINTAINER Maksim Kostromin https://github.com/daggerok
RUN apk --no-cache add busybox-suid bash curl sudo \
 && adduser -h /home/appuser -s /bin/bash -D -u 1025 appuser wheel \
 && echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && apk del busybox-suid \
 && rm -rf /tmp/* /var/cache/apk/*
USER appuser
WORKDIR /home/appuser
VOLUME /home/appuser
ENTRYPOINT java -jar ./app.jar && sleep 60
CMD /bin/bash
EXPOSE 8080
HEALTHCHECK --interval=3s --timeout=3s --retries=15 CMD curl -f http://127.0.0.1:8080/health || exit 1
COPY --chown=appuser ./target/*.jar ./app.jar
