GROUP := github.com/TheoBrigitte
NAME := wrk2

DOCKER_IMAGE := theo01/${NAME}

VERSION := $(shell git describe --always --long --dirty --tags || date)

all: package publish

build:
	@mkdir -p /usr/src/wrk2
	@git clone https://github.com/giltene/wrk2.git /usr/src/wrk2
	@cd /usr/src/wrk2 && make

package:
	@docker build -t ${DOCKER_IMAGE} .

publish:
	@docker push ${DOCKER_IMAGE}

.PHONY: server build package publish
