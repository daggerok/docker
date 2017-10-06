# Cassandra for Docker

clone dschroe/cassandra-docker repository:

```bash
git clone https://github.com/dschroe/cassandra-docker .
```

prepare initial db script:

```bash
mkdir docker-entrypoint-initdb.d
vim docker-entrypoint-initdb.d/init.cql
# ...
```

use compose to simplify bootstrap:

```bash
vim docker-compose.yml
# ...
```

```bash
docker-compose up --build
# ...
cassadnra_1  | INFO  [MigrationStage:1] 2017-10-06 20:14:48,548 ColumnFamilyStore.java:406 - Initializing demo.model
```

have fun!

**original README**

You can copy .cql files under __docker-entrypoint-initdb.d/__ directory.

They will automatically be invoked as soon as Apache-Cassandra is available.
