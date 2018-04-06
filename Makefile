CI_BUILD_NUMBER ?= $(USER)-snapshot
VERSION ?= 0.1.$(CI_BUILD_NUMBER)
DOCKER_TAG=meetup/xray:$(VERSION)

package:
	docker build -t $(DOCKER_TAG) .

deploy: package
	@docker push $(DOCKER_TAG)