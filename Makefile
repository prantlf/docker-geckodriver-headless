clean ::
	docker image rm geckodriver-headless prantlf/geckodriver-headless registry.gitlab.com/prantlf/docker-geckodriver-headless

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t geckodriver-headless .
	docker tag geckodriver-headless prantlf/geckodriver-headless
	docker tag geckodriver-headless registry.gitlab.com/prantlf/docker-geckodriver-headless

shell ::
	docker run --rm -it --entrypoint=busybox geckodriver-headless sh

run ::
	docker run --rm -it -p 4444:4444 geckodriver-headless

start ::
	docker run --rm -d --name geckodriver -p 4444:4444 geckodriver-headless

stop ::
	docker kill geckodriver

show ::
	docker logs geckodriver

login ::
	docker login --username=prantlf
	docker login registry.gitlab.com --username=prantlf

pull ::
	docker pull prantlf/geckodriver-headless
	docker pull registry.gitlab.com/prantlf/docker-geckodriver-headless

push ::
	docker push prantlf/geckodriver-headless
	docker tag prantlf/geckodriver-headless prantlf/geckodriver-headless:101
	docker push prantlf/geckodriver-headless:101
	docker tag registry.gitlab.com/prantlf/docker-geckodriver-headless registry.gitlab.com/prantlf/docker-geckodriver-headless:101
	docker push registry.gitlab.com/prantlf/docker-geckodriver-headless:101
