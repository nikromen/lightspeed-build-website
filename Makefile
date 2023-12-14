CONTAINER_ENGINE ?= $(shell command -v podman 2> /dev/null || echo docker)


build-prod:
	$(CONTAINER_ENGINE) -f docker-compose.prod.yaml build --no-cache

# don't forget to log in to quay.io
push-prod:
	$(CONTAINER_ENGINE) -f docker-compose.prod.yaml push
