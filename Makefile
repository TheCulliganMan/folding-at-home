IMAGE_NAME = theculliganman/folding-at-home
IMAGE_TAG = latest
CONTAINER_NAME := folding-at-home
USER_NAME := theculliganman
TEAM := 229500
USE_GPU := true
SMP_CLIENT := true 
POWER_LEVEL := full

pull:
	docker pull ${IMAGE_NAME}:${IMAGE_TAG}

run: pull
	$(MAKE) build
	$(MAKE) stop || true
	docker run \
		-d \
		--gpus all \
		--name ${CONTAINER_NAME} \
		--restart unless-stopped \
		-p 7396:7396 \
		-v $(PWD)/workdir:/usr/src/app \
		${IMAGE_NAME}:${TAG} \
		--user=${USER_NAME} \
		--team=${TEAM} \
		--gpu=${USE_GPU} \
		--smp=${SMP_CLIENT} \
		--power=${POWER_LEVEL}

logs:
	docker logs -f --tail=1000 ${CONTAINER_NAME}

top:
	docker top ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

clean: stop
	docker rmi ${CONTAINER_NAME}

exec:
	docker exec -it ${CONTAINER_NAME} bash
