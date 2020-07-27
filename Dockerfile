FROM alpine:latest
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk --no-cache add firefox-esr && \
    cd /root && \
    # Wait for the release of 0.27 which will not depend on glibc.
    #$BASE_URL=https://github.com/mozilla/geckodriver/releases/download && \
    #$VERSION=$(wget -O- https://api.github.com/repos/mozilla/geckodriver/releases/latest |
    #  grep tag_name | cut -d '"' -f 4) && \
    #$wget "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" && \
    wget https://firefox-ci-tc.services.mozilla.com/api/queue/v1/task/Lw-y4Y_WSd62yyRvzvXEtA/runs/0/artifacts/public/build/geckodriver.tar.gz && \
    tar xf geckodriver.tar.gz geckodriver -C /usr/local/bin && \
    rm geckodriver.tar.gz
COPY . /

ENTRYPOINT ["geckodriver"]
CMD ["--host=0.0.0.0", "--port=4444"]
EXPOSE 4444
