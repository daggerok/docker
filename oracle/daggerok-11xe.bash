#!/bin/bash
docker container run -it -p 8080:8080 -p 1521:1521 --name oracle-xe --shm-size=1g daggerok/oracle-xe
#docker container stop oracle
#docker container run -ia oracle
##docker container run -it -e ORACLE_PWD=password -p 8080:8080 -p 1521:1521 --name oracle --shm-size=1g daggerok/oracle:xe
