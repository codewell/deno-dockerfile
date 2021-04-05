FROM ubuntu:18.04

WORKDIR /usr/src/app

ENV DENO_INSTALL=/root/.deno

RUN apt-get update && \
  apt-get --assume-yes install curl unzip  && \
  curl -fsSL https://deno.land/x/install/install.sh | sh && \
  mv /root/.deno/bin/deno /bin/deno && \
  deno install -qAf --unstable https://deno.land/x/denon/denon.ts && \
  mv /root/.deno/bin/denon /bin/denon

COPY . .

ENTRYPOINT [ "denon" ]

CMD [ "run" ]
