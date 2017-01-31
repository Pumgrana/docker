PROJECT_NAME := pumgrana-proxy
REGISTRY := docker.pumgrana.com
# REGISTRY_NAME := $(REGISTRY)/$(PROJECT_NAME)
REGISTRY_NAME := $(PROJECT_NAME)
LATEST := $(REGISTRY_NAME):latest

docker:
	docker build -t $(LATEST) .

push:
	$(eval VERSION = $(shell date +%Y%m%d%H))
	$(eval FREEZE_NAME = $(REGISTRY_NAME):$(VERSION))
	docker tag $(LATEST) $(FREEZE_NAME)
	docker push $(FREEZE_NAME)
