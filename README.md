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