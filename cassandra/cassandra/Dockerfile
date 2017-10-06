
# maybe use laTesT docker-image-version of cassandra?
FROM cassandra:3.11

# replace docker's official enTrypoinT here
COPY docker-entrypoint.sh /docker-entrypoint.sh

# make my modified enTrypoinT execuTable
RUN chmod a+x docker-entrypoint.sh

# ENTRYPOINT will be called in parenT-docker-image!

