
SHELL := /usr/bin/bash
ENVIRONMENTS := dev staging prod

all:

init:
	for env in $(ENVIRONMENTS); do \
		mkdir -p apps/$$env clusters/$$env/apps clusters/$$env/infra clusters/$$env/flux-system infra/$$env; \
		touch apps/$$env/.gitkeep clusters/$$env/apps/.gitkeep clusters/$$env/infra/.gitkeep clusters/$$env/flux-system/.gitkeep  infra/$$env/.gitkeep; \
	done
	mkdir -p apps/base infra/base
	touch apps/base/.gitkeep infra/base/.gitkeep

push:
	git pull && git add -A && git commit -m "Update" && git push

