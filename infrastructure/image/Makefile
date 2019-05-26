include lib.mk

packer=$(call which, packer)

build: image_id.txt ## Build a new copy of the machine image
	$(info Done!)

image_id.txt: packer.json packer_vars.json $(packer)
	$(packer) build -var-file=packer_vars.json -machine-readable packer.json \
		| awk -F',' '$$2=="triton" && $$3=="artifact" && $$5=="id" { print $$6 }' \
		> $@
