include lib.mk

packer=$(call which, packer)

build: build_success.txt ## Build a new copy of the machine image
	$(info Done!)

build_success.txt: packer.json packer_vars.json
	packer build -var-file=packer_vars.json packer.json
