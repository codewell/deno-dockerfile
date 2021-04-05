FROM ubuntu:18.04

WORKDIR /usr/src/app

RUN apt-get update && \
  apt-get --assume-yes install curl unzip  && \
  curl -fsSL https://deno.land/x/install/install.sh | sh && \
  mv /root/.deno/bin/deno /bin/deno

COPY . .

ENTRYPOINT [ "deno" ]

CMD [ "run" ]
