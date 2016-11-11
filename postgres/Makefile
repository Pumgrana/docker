PROJECT_NAME := pumgrana-postgres
REGISTRY := docker.pumgrana.com

docker:
	docker build -t $(PROJECT_NAME) .

push:
	docker tag $(PROJECT_NAME) $(REGISTRY)/$(PROJECT_NAME)
	docker push $(REGISTRY)/$(PROJECT_NAME)

pull:
	docker pull $(REGISTRY)/$(PROJECT_NAME)
