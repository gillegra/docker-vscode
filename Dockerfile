# https://github.com/ctaggart/golang-vscode
# https://hub.docker.com/r/ctaggart/golang-vscode/

# https://golang.org/
# https://hub.docker.com/_/golang/
# https://github.com/docker-library/golang

FROM buildpack-deps:stretch

LABEL maintainer="gillegra@gmail.com" \
  org.label-schema.name="docker-vscode" \
  org.label-schema.version="1.2" \
  org.label-schema.description="A simple base environment to use for development. Only requirements are to include Visual Studio Code, an X window client, and a Docker engine." \
  org.label-schema.license="MIT" \
  org.label-schema.schema-version="1.0" 

COPY . /root

RUN useradd -m vscode -s /bin/bash \
  && /root/install-vscode-base.sh \
  && su - vscode -c "code --install-extension Shan.code-settings-sync"

ENTRYPOINT [ "su", "-", "vscode", "-c" ]
CMD [ "code -w" ]
