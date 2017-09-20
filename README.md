# openshift-postgres

Dockerfiles extending the oficial Openshift images

# Installation:

Frist install the templates with the makefile:

```
make create-build OS_PROJECT=${OS_PROJECT}
```

And build the image
```	
make start-build-postgresql OS_PROJECT=${OS_PROJECT}
```

# Configuration

We can disable the logging to the STOUD with the ENV variable:

```
ENV EXPORT_LOG=false
```


# TODO

The logging to the STDOUT will only work if the database is created.

We will need to start the pod for a second time to have the logs, as the tail needs the db to be created.