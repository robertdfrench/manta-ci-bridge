include lib.mk

npm=$(call which, npm)

test: ## Run unit tests
	$(info Done!)

install: node_modules/latest ## Gather dependencies
	$(info Done!)

node_modules/latest: package.json package-lock.json $(npm)
	$(npm) install
	@touch $@
