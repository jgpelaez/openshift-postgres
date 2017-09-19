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
	
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo -e "Arguments/env variables: \n \
				"