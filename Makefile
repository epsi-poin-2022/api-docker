# Executables (local)
DOCKER_COMP = docker compose

# Docker containers
PHP_CONT = $(DOCKER_COMP) exec php
NODE_CONT = $(DOCKER_COMP) exec node

# Executables
PHP      = $(PHP_CONT) php
COMPOSER = $(PHP_CONT) composer
SYMFONY  = $(PHP) bin/console
NPM     = $(NODE_CONT) npm

# Misc
.DEFAULT_GOAL = help
.PHONY        = help build up start down logs sh composer vendor sf cc

## —— 🎵 🐳 The Symfony-docker Makefile 🐳 🎵 ——————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

## —— Docker 🐳 ————————————————————————————————————————————————————————————————
build: ## Builds the Docker images
	@$(DOCKER_COMP) build --pull --no-cache

up: ## Start the docker hub in detached mode (no logs)
	@$(DOCKER_COMP) up --detach

start: ## Start the containers
	@$(DOCKER_COMP) start

stop: ## Stop the containers
	@$(DOCKER_COMP) stop

down: ## Stop the docker hub
	@$(DOCKER_COMP) down --remove-orphans

logs: ## Show live logs
	@$(DOCKER_COMP) logs --tail=0 --follow

sh: ## Connect to the PHP FPM container
	@$(PHP_CONT) sh

## —— Composer 🧙 ——————————————————————————————————————————————————————————————
composer: ## Run composer, pass the parameter "c=" to run a given command, example: make composer c='req symfony/orm-pack'
	@$(eval c ?=)
	@$(COMPOSER) $(c)

vendor: ## Install vendors according to the current composer.lock file
vendor: c=install
vendor: composer

## —— Node/npm ——————————————————————————————————————————————————————————————
npm: ## Run npm, pass the parameter "c=" to run a given command, example: make npm c='rum watch'
	@$(eval c ?=)
	@$(NPM) $(c)

node_modules: ## Install node modules
node_modules: c=install
node_modules: npm

watch: ## npm run watch
watch: c=run watch
watch: npm

## —— Symfony 🎵 ———————————————————————————————————————————————————————————————
sf: ## List all Symfony commands or pass the parameter "c=" to run a given command, example: make sf c=about
	@$(eval c ?=)
	@$(SYMFONY) $(c)

cc: c=c:c ## Clear the cache
cc: sf

reset-database: ## Reset the database
	@$(SYMFONY) doctrine:database:drop --force
	@$(SYMFONY) doctrine:database:create
	@$(SYMFONY) doctrine:schema:update --force

fixtures: ## Load fixtures in database
	@$(SYMFONY) doctrine:fixtures:load -n

reset-test-database: ## Reset test database
	@$(SYMFONY) doctrine:database:drop --force --env=test
	@$(SYMFONY) doctrine:database:create --env=test
	@$(SYMFONY) doctrine:schema:update --force --env=test

test-fixtures: ## Load fixtures in test database
	@$(SYMFONY) doctrine:fixtures:load -n --env=test

test: ## Launch tests
	@$(PHP) bin/phpunit