clean ::
	docker image rm geckodriver-headless

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t geckodriver-headless .

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

tag ::
	docker tag geckodriver-headless prantlf/geckodriver-headless:latest

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/geckodriver-headless:latest
