FROM tenstartups/redis-commander
MAINTAINER Maksim Kostromin https://github.comm/daggerok
RUN apk --no-cache add curl
HEALTHCHECK --interval=30s --timeout=30s --retries=10 CMD curl -f http://127.0.0.1:8081 || exit 1
