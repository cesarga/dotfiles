FROM ubuntu:18.04
LABEL mantainer="César García Acebal <cesarga@d3riva.com>"

# NOT IMPLEMENTED

RUN apt-get update \
     && apt-get install -y --no-install-recommends curl

RUN curl -sfL https://git.io/cesarga | sh || true

WORKDIR /home
CMD /usr/bin/zsh
