.ONESHELL:
SHELL := /bin/bash
NAMESPACE ?= logging
FOLDER_NAME ?= manifests
PROVIDER_NAME ?= aws

install:
	kubectl create namespace $(NAMESPACE) || true
	cd $(FOLDER_NAME)
	kubectl apply -f . -n $(NAMESPACE)
	cd $(PROVIDER_NAME)
	kubectl apply -f . -n $(NAMESPACE)

install-dry-run: 
	cd $(FOLDER_NAME)
	kubectl apply -f . -n $(NAMESPACE) --dry-run
	cd $(PROVIDER_NAME)
	kubectl apply -f . -n $(NAMESPACE) --dry-run

delete:
	cd $(FOLDER_NAME)
	kubectl delete -f . -n $(NAMESPACE)
	cd $(PROVIDER_NAME)
	kubectl delete -f . -n $(NAMESPACE)
