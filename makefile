.PHONY: help
.DEFAULT_GOAL := help


export REDEPLOY_OPENSHIFT_TEMPLATE?=false


login-openshift:  ## login openshift-sb environment
	oc login ${OPENSHIFT_URL} -u ${OPENSHIFT_USER}
	oc whoami -t

create-build:  ## Create build and imagestream
	oc new-app -f openshift/app-is-template.yaml \
		-p APP_NAME=${APP_NAME} \
		 -n ${OS_PROJECT}
	oc new-app -f openshift/app-build-from-template.yaml \
		-p APP_NAME=${APP_NAME} \
		 -n ${OS_PROJECT}

start-build-postgresql:  ## start-build-postgresql
	oc start-build lg-postgresql \
		--from-dir=./9.4-rhel7 \
		--wait=true \
		-n ${OS_PROJECT}
		
docker-build-postgresql:  ## start-build-postgresql
	docker build ./9.4-rhel7 -t postgres-9.4-rhel7 
	
docker-run-postgresql:  ## start-build-postgresql
	docker run --rm -p 5432:5432 \
		--privileged=true \
		-e POSTGRESQL_USER=user \
		-e POSTGRESQL_PASSWORD=pwd \
		-e POSTGRESQL_DATABASE=db \
		-v /home/juancarlos/git/openshift-postgres/data:/var/lib/pgsql/data \
		postgres-9.4-rhel7 
	
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo -e "Arguments/env variables: \n \
				"