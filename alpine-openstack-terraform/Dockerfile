# docker run --rm -it alpine:3.8 ash
FROM apline:3.8
RUM apk add --no-cache python-dev \
                       libffi-dev \
                       py2-cffi \
                       py2-netifaces \
                       openssl-dev \
                       readline-dev \
                       python2-tkinter \
                       gcc \
                       musl-dev \
                       py2-pip \
                       terraform \
 && pip install --upgrade --no-cache-dir pip \
 && pip install --upgrade python-openstackclient \
 && apk del --no-cache musl-dev eadline-dev openssl-dev libffi-dev python-dev \
 && rm -rf /var/cache/apk/*
 CMD /bin/ash
 
