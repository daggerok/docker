# docker build -t hg .
# docker run --rm --name hg -it -p 22:22 -p 8080:8080 hg:latest
# docker exec -it hg bash
# sudo -s

FROM alpine:3.5
MAINTAINER Maksim Kostromin https://github.com/daggerok
RUN apk --no-cache add busybox-suid bash mercurial sudo \
 && adduser -h /home/hg -s /bin/bash -D -u 1025 hg wheel \
 && echo "hg ALL=(ALL:ALL) ALL" >> /etc/sudoers \
 && sed -i "s/.*requiretty$/Defaults !requiretty/" /etc/sudoers \
 && hgpassword=$(echo Admin.123 | mkpasswd) \
 && echo "hg sudo password: ${hgpassword}" \
 && echo "hg:${hgpassword}" | chpasswd \
 && apk del busybox-suid \
 && rm -rf /tmp/* /var/cache/apk/*
USER hg
RUN mkdir -p /home/hg/repo \
 && cd /home/hg/repo \
 && hg init
WORKDIR /home/hg/repo
VOLUME /home/hg
ENTRYPOINT hg serve -p 8080 -a 0.0.0.0 --verbose
CMD /bin/bash
EXPOSE 22 8080
