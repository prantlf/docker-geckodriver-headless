FROM alpine:3.13
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk --no-cache add firefox
RUN cd /root && \
    BASE_URL=https://github.com/mozilla/geckodriver/releases/download && \
    VERSION=v0.29.0 && \
    wget "$BASE_URL/$VERSION/geckodriver-$VERSION-linux64.tar.gz" && \
    tar xf geckodriver-$VERSION-linux64.tar.gz geckodriver -C /usr/local/bin && \
    rm geckodriver-$VERSION-linux64.tar.gz
COPY . /

ENTRYPOINT ["geckodriver"]
CMD ["--host=0.0.0.0", "--port=4444"]
EXPOSE 4444
