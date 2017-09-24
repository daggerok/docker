FROM openjdk:8u131-jre-alpine
MAINTAINER Maksim Kostromin <daggerok@gmail.com>
RUN mkdir -p /opt/app \
    && touch /opt/app/app.jar \
    && apk --no-cache add curl
WORKDIR /opt/app
VOLUME ["/opt/app"]
ENTRYPOINT ["java", "-jar", "/opt/app/app.jar"]
EXPOSE 8888
HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://127.0.0.1:8888/health || exit 1
COPY ./build/libs/spring-config-0.0.1.jar ./app.jar
