FROM alpine

LABEL org.opencontainers.image.authors="w.leon.seng@gmail.com"

ARG pgcli_version

RUN apk add --no-cache \
        python3 \
        libevent \
        libpq && \
    apk add --no-cache --virtual .build-deps \
        python3-dev \
        postgresql-dev \
        libevent-dev \
        musl-dev \
        gcc && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install pgcli==$pgcli_version && \
    apk del .build-deps

ENTRYPOINT ["pgcli"]
CMD ["--version"]
