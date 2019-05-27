include lib.mk

.PHONY: deploy

deploy:  ## Deploy changes to Triton
	$(MAKE) -C infrastructure deploy

check:  ## Lint and Test
	$(MAKE) -C infrastructure plan

install: node_modules/latest ## Gather dependencies
	$(info Done!)

node_modules/latest: package.json package-lock.json $(npm)
	$(npm) install
	@touch $@
