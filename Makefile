clean ::
	docker image rm geckodriver-headless:85

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t geckodriver-headless:85 .

shell ::
	docker run --rm -it --entrypoint=busybox geckodriver-headless:85 sh

run ::
	docker run --rm -it -p 4444:4444 geckodriver-headless:85

start ::
	docker run --rm -d --name geckodriver -p 4444:4444 geckodriver-headless:85

stop ::
	docker kill geckodriver

show ::
	docker logs geckodriver

tag ::
	docker tag geckodriver-headless:85 prantlf/geckodriver-headless:85

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/geckodriver-headless:85
