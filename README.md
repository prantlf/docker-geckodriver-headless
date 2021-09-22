# prantlf/geckodriver-headless

[Docker] image: Firefox and GeckoDriver for headless tests on Alpine Linux

[![prantlf/geckodriver-headless](http://dockeri.co/image/prantlf/geckodriver-headless)](https://hub.docker.com/repository/docker/prantlf/geckodriver-headless/)

[This image] is supposed to help testing browser applications in [headless Firefox] driven by [`geckodriver`]. This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. [Firefox] and `geckodriver` have to be updated from time to time by triggering a new build manually.

If you have trouble pulling the image from the Docker's default hub.docker.com, try gitlab.com, where [this project] is primarily maintained: `registry.gitlab.com/prantlf/docker-geckodriver-headless`.

## Tags

- [`latest`], `89`, `85`

## Install

    docker pull prantlf/geckodriver-headless

## Use

Run the container in the foreground:

    docker run --rm -it -p 4444:4444 geckodriver-headless

Run the container in the background before you start testing:

    docker run --rm -d --name geckodriver -p 4444:4444 geckodriver-headless

Inspect the logging on the console:

    docker logs geckodriver

Stop and remove the container after you stopped testing:

    docker kill geckodriver

You can include this image in a `docker-compose.yml` for [docker-compose] too:

```yaml
version: 3.8
services:
  geckodriver:
    image: prantlf/geckodriver-headless
    init: true
    tmpfs: /tmp
    ports:
      - 127.0.0.1:4444:4444
```

GeckoDriver will start with the following parameters by default:

    --host=0.0.0.0 --port=4444

All available command-line arguments for the `geckodriver` executable, which
you can append to the statement running the dockjer container:

        --connect-existing  Connect to an existing Firefox instance
        --jsdebugger        Attach browser toolbox debugger for Firefox
    -v                      Log level verbosity (-v for debug and -vv for trace level)
    -b, --binary <BINARY>   Path to the Firefox binary
        --log <LEVEL>       Set Gecko log level [possible values: fatal, error,
                            warn, info, config, debug, trace]
        --marionette-host <HOST>  Host to use to connect to Gecko
                                  [default: 127.0.0.1]
        --marionette-port <PORT>  Port to use to connect to Gecko
                                  [default: system-allocated port]
        --host <HOST>  Host IP to use for WebDriver server [default: 127.0.0.1]
    -p, --port <PORT>  Port to use for WebDriver server [default: 4444]

## Build, Test and Publish

The local image is built as `geckodriver-headless` and pushed to the docker hub with the tag `prantlf/geckodriver-headless:latest`.

    # Remove an old local image:
    make clean
    # Build and tag new local images:
    make build
    # Enter an interactive shell inside the latest created image:
    make shell
    # Tag the local image for pushing:
    make tag
    # Login to the docker hub:
    make login
    # Push the local image to the docker hub:
    make push

## License

Copyright (c) 2019-2021 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/geckodriver-headless
[this project]: https://gitlab.com/prantlf/docker-geckodriver-headless#prantlfgeckodriver-headless
[`latest`]: https://hub.docker.com/repository/docker/prantlf/geckodriver-headless/tags
[headless Firefox]: https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Headless_mode
[`geckodriver`]: https://github.com/mozilla/geckodriver#readme
[Firefox]: https://www.mozilla.org/firefox/
[Alpine Linux]: https://alpinelinux.org/
[docker-compose]: https://docs.docker.com/compose/
