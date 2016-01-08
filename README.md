## CouchDB Docker Image

This repository is used to build CouchDB Docker images.

### Port(s) exposed

* ``5984 TCP``

### Base Docker image

* [inclusivedesign/centos](https://registry.hub.docker.com/u/inclusivedesign/centos/)

### Environment variables

* ``COUCHDB_CREATE_ADMIN_USER`` - set this to ``true`` if a CouchDB administrator account should get created (defaults to ``false``)
* ``COUCHDB_ADMIN_USERNAME`` - name of the administrator account (no default)
* ``COUCHDB_ADMIN_PASSWORD`` - administrator account's password (no default)
* ``CONTAINER_TEST`` - setting this to ``true`` will launch a temporary container which will exit after starting the CouchDB service, ensuring the service remains available to receive requests, creating a test database, and then deleting it

### Build the image

```
sudo docker build --rm=true -t inclusivedesign/couchdb .
```

### Start a container

If a CouchDB container hasn't been created using this image, run it like so:

```
sudo docker run \
--name="couchdb" \
-d \
-p 5984:5984 \
-e COUCHDB_CREATE_ADMIN_USER=true \
-e COUCHDB_ADMIN_USERNAME=testname \
-e COUCHDB_ADMIN_PASSWORD=testpassword \
inclusivedesign/couchdb
```

If a container has been previously created using this image then it should be started like so:

```
sudo docker run \
--name="couchdb" \
-d \
-p 5984:5984 \
-e COUCHDB_ADMIN_USERNAME=testname \
-e COUCHDB_ADMIN_PASSWORD=testpassword \
inclusivedesign/couchdb
```

### Test this image

```
sudo docker run \
--name="couchdb" \
-p 5984:5984 \
-e CONTAINER_TEST=true \
-e COUCHDB_CREATE_ADMIN_USER=true \
-e COUCHDB_ADMIN_USERNAME=testname \
-e COUCHDB_ADMIN_PASSWORD=testpassword \
inclusivedesign/couchdb
```

