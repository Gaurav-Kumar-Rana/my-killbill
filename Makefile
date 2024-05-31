set_github_token:
	export GH_TOKEN=<your git hub toaken> && \
	gh repo clone Gaurav-Kumar-Rana/killbill-admin-ui-standalone && \
	gh repo clone Gaurav-Kumar-Rana/killbill-admin-ui

build-local-kaui-containers: set_github_token ## Build the kaui:local
	docker build -t kaui:local -f Dockerfile .

start-local-containers: build-local-kaui-containers ## Start local-containers in the foreground
	docker compose up
