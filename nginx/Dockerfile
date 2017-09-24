FROM nginx:stable-alpine
MAINTAINER Maksim Kostromin <daggerok@gmail.com>
RUN apk --no-cache add curl
HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://127.0.0.1:80/ || exit 1
COPY ./www /usr/share/nginx/html
