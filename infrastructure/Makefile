include lib.mk

.PRECIOUS: terraform.tfstate
terraform=$(call which, terraform)
SOURCES=$(wildcard *.tf) terraform.tfvars provision.sh image.auto.tfvars

deploy: terraform.tfstate ## Deploy changes
	$(terraform) output -state=$<

terraform.tfstate: terraform.plan $(terraform)
	$(terraform) apply $<

terraform.plan: .terraform/ready $(terraform) $(SOURCES)
	$(terraform) plan -out=$@

plan: .terraform/ready $(terraform) ## Review the plan
	$(terraform) plan

lint: $(terraform) ## Make sure your terraform looks nice
	$(terraform) fmt -check -diff

.terraform/ready: $(terraform)
	$(terraform) init
	@touch $@

image.auto.tfvars: image/image_id.txt
	echo "host_image_id = \"`cat $<`\"" > $@

image/image_id.txt:
	$(MAKE) -C image build
