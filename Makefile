TAG := $(GITHUB_REF)
ifeq ($(TAG),)
	TAG := $(shell git symbolic-ref --short -q HEAD)
endif
ifeq ($(TAG),)
	TAG := $(shell git rev-parse --short --verify HEAD)
endif

define docker_build_and_push
	docker buildx build \
		--push \
		--platform linux/arm64,linux/amd64 \
		-t "schickling/$1:$(if $2,$2,$(TAG))" \
		./$1
endef

help:
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[0-9a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	@echo $(TAG)

all: jekyll mailcatcher mysql-backup-s3 nodejs postgres-backup-s3 postgres-restore-s3 redis-commander rust

.PHONY: jekyll # (This image is not compatible with arm architecture)
jekyll: ## Build jekyll image
	docker buildx build \
		--push \
		--platform linux/amd64 \
		-t "schickling/$1" \
		./$1

.PHONY: mailcatcher
mailcatcher: ## Build mailcatcher image
	$(call docker_build_and_push,mailcatcher)

.PHONY: mysql-backup-s3
mysql-backup-s3: ## Build mysql-backup-s3 image
	$(call docker_build_and_push,mysql-backup-s3)

.PHONY: nodejs
nodejs: ## Build nodejs image
	$(call docker_build_and_push,nodejs)

.PHONY: postgres-backup-s3
postgres-backup-s3: ## Build postgres-backup-s3 image
	$(call docker_build_and_push,postgres-backup-s3)

.PHONY: postgres-restore-s3
postgres-restore-s3: ## Build postgres-restore-s3 image
	$(call docker_build_and_push,postgres-restore-s3)

.PHONY: redis-commander
redis-commander: ## Build redis-commander image
	$(call docker_build_and_push,redis-commander)

.PHONY: rust
rust: ## Build rust image
	$(call docker_build_and_push,rust)
