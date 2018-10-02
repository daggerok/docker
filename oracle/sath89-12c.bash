#!/bin/bash
docker container run -it -p 8080:8080 -p 1521:1521 --name oracle sath89/oracle-12c
#docker container stop oracle
#docker container start -ia oracle
