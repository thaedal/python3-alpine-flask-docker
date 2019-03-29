.PHONY: clean build run stop inspect

IMAGE_NAME=thaedal/python3-flask-alpine
CONTAINER_NAME=flask-demo

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm -p 5000:5000 --name $(CONTAINER_NAME) $(IMAGE_NAME)

release:
	docker build \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` -t $(IMAGE_NAME) .

inspect:
	docker inspect $(CONTAINER_NAME)

shell:
	docker exec -it $(CONTAINER_NAME) /bin/sh

stop:
	docker stop $(CONTAINER_NAME)

clean:
	docker ps -aq --filter "name=$(CONTAINER_NAME)" | xargs docker rm
	docker images -q "$(IMAGE_NAME)" | xargs docker rmi
