# This docker compose file bootstrapping fresh mysql server with phpMyAdmin server.

_Could be used for quick project bootstrap or even development_

## phpMyAdmin connection configuration:

```
server:               mysql
user:                 root
password:             root-db-password
```

## MySQL connection configuration (per app):

```
server (from docker): mysql
server (from local):  0.0.0.0 or 127.0.0.1 or localhost
application user:     app-db-user
application password: app-db-password
application database: app-database
```
