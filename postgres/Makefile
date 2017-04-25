PROJECT_NAME := pumgrana-postgres
REGISTRY := docker.pumgrana.com

docker:
	docker build -t $(PROJECT_NAME):latest .

push:
	docker tag $(PROJECT_NAME):latest $(REGISTRY)/$(PROJECT_NAME)
	docker push $(REGISTRY)/$(PROJECT_NAME)
