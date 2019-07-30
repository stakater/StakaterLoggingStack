.ONESHELL:
SHELL := /bin/bash
NAMESPACE ?= logging
FOLDER_NAME ?= manifests

install:
	kubectl create namespace $(NAMESPACE) || true
	cd $(FOLDER_NAME)
	kubectl apply -f . -n $(NAMESPACE)

install-dry-run: 
	cd $(FOLDER_NAME)
	kubectl apply -f . -n $(NAMESPACE) --dry-run

delete:
	cd $(FOLDER_NAME)
	kubectl delete -f . -n $(NAMESPACE)