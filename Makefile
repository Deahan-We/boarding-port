SHELL = /bin/bash
CURRENT_DIR = $(shell pwd)
SCRIPT_DIR := $${CURRENT_DIR}/scripts

prepare-flight:
	set -e; \
	echo "Prepare for flight.."; \
	WORK_DIR=${CURRENT_DIR}/scripts; \
	pushd $$WORK_DIR; \
	$$WORK_DIR/install_terraform.sh; \
	popd 

start-flight:	
	echo "${WORK_DIR}"; \
	pushd $(WORK_DIR)/tf; \
	terraform init; \
	terraform plan; \
	terraform apply --auto-approve; \
	popd

