include lib.mk

.PHONY: deploy

install:  ## Deploy changes to Triton
	$(MAKE) -C infrastructure deploy

check:  ## Lint and Test
	$(MAKE) -C infrastructure plan
	$(MAKE) -C application test
