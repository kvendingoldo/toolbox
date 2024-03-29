IMAGE := kvendingoldo/toolbox
TS    ?= $(shell /bin/date "+%Y%m%d-%H%M%S")

help: ## Display this help.
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

build: ## Build docker container.
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(IMAGE):$(TS)

push: ## Push docker container to docker hub registry.
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(TS)

version:
	@echo $(TS)
