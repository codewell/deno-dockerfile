FROM ubuntu:18.04

WORKDIR /usr/src/app

RUN apt-get update && \
  apt-get --assume-yes install curl && \
  apt-get --assume-yes install unzip  && \
  curl -fsSL https://deno.land/x/install/install.sh | sh && \
  echo 'export DENO_INSTALL=/root/.deno' >> "${HOME}/.bash_profile" && \
  echo 'export PATH=$DENO_INSTALL/bin:$PATH' >> "${HOME}/.bash_profile" && \
  . "${HOME}/.bash_profile"

COPY . .

ENTRYPOINT [ "/root/.deno/bin/deno" ]

CMD [ "run" ]
