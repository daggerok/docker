FROM node:8.7.0-alpine
MAINTAINER Maksim Kostromin https://github.comm/daggerok
RUN apk --no-cache add busybox-suid bash curl \
 && addgroup app-group \
 && adduser -h /home/app -s /bin/bash -D -u 1025 app app-group \
 && npm install -g redis-commander
EXPOSE 8081
USER app
WORKDIR /home/app
RUN echo "{}" > ${HOME}/.redis-commander
ARG REDIS_HOST="redis"
ENV REDIS_HOST ${REDIS_HOST}
ENTRYPOINT redis-commander --redis-host ${REDIS_HOST}
HEALTHCHECK --interval=10s --timeout=10s --retries=10 CMD curl -f http://127.0.0.1:8081 || exit 1
