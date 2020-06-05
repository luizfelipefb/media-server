.DEFAULT_GOAL := help

help: ## Show this help
	@echo -e '\n Usage:'
	@echo 'make <target>'
	@echo
	@echo ' Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

all: home-automation media-server system-monitor ## Create all containers

home-automation: ## Create home automation containers
	@echo -e '\n==> Creating Home Automation containers\n'
	@docker-compose -p home-automation -f docker/home-automation.yml up -d

media-server: ## Create media server containers
	@echo -e '\n==> Creating Media Server containers\n'
	@docker-compose -p media-server -f docker/media-server.yml up -d

system-monitor: ## Create system monitor containers
	@echo -e '\n==> Creating System Monitor containers\n'
	@docker-compose -p system-monitor -f docker/system-monitor.yml up -d

create-retention: ## Create retention policy for telegraf influx database
	@echo -e '\n==> Adding retention policy for telegarf db\n'
	@curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE RETENTION POLICY "one_week_only" ON "telegraf" DURATION $(DUR) REPLICATION 1 DEFAULT"

update: ## Update images
	@echo -e '\n==> Updating images'
	@docker images --format "{{.Repository}}" | xargs -i sh -c 'echo -e "\n- Pulling {}" && docker pull {}'

prune: ## Prune dangling images
	@echo -e '\n==> Pruning images'
	@docker image prune -f
