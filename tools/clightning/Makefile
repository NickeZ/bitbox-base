.DEFAULT_GOAL := aarch64
CONTAINER=lightning-aarch64-toolchain
REPO_ROOT=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))/../..

check-env:
	@echo "Checking if docker image is available (otherwise run 'make -C tools/clightning dockerinit')"
	[ -n "$$(docker images --filter reference=${CONTAINER} -q)" ] || exit 1

dockerinit:
	docker build -t ${CONTAINER} .

dockershell: check-env
	docker run -ti -v $(shell pwd):/lightning -w /lightning ${CONTAINER} bash

aarch64: check-env
	docker run -ti -v $(shell pwd):/lightning -w /lightning ${CONTAINER}
	cp ${REPO_ROOT}/tools/clightning/lightning/lightningd/lightningd ${REPO_ROOT}/bin/

