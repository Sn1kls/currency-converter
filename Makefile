.PHONY: help install dev build docker-build docker-up docker-down docker-restart docker-logs clean test start stop

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

install:
	npm install

dev:
	npm start

build:
	npm run build

test:
	npm test

docker-build:
	docker-compose build

docker-up:
	docker-compose up -d

docker-down:
	docker-compose down

docker-restart: docker-down docker-up

docker-logs:
	docker-compose logs -f

docker-shell:
	docker-compose exec exchangery sh

clean:
	rm -rf node_modules build

start: docker-build docker-up

stop: docker-down

.DEFAULT_GOAL := help
