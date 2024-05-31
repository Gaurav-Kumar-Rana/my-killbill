build-local-kaui-containers: ## Build the kaui:local
	docker build -t kaui:local -f Dockerfile .
