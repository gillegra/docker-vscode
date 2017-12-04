# https://github.com/ctaggart/golang-vscode
# https://hub.docker.com/r/ctaggart/golang-vscode/

# https://golang.org/
# https://hub.docker.com/_/golang/
# https://github.com/docker-library/golang

# FROM ubuntu:16.04
FROM golang:latest

LABEL maintainer="gillegra@gmail.com" \
    org.label-schema.name="VSCode dev env base" \
    org.label-schema.description="A simple base environment to use for development. Only requirements are to include Visual Studio Code and an X11 client." \
    org.label-schema.license="MIT" \
    org.label-schema.version="1.0" \
    org.label-schema.schema-version="1.0" 

COPY root /root

ENV DEBIAN_FRONTEND noninteractive

# for development
# ip=`ifconfig bridge100 | grep inet | awk '$1=="inet" {print $2}'`
# docker run --rm -it -v $PWD/root:/root -w /root -e DISPLAY=$ip:0 golang:latest

RUN cd /root \
  && ./install-apt-packages.sh \
  && useradd -m vscode -s /bin/bash \
  && cp install-vscode-*.sh /home/vscode/ \
  && chown vscode:vscode /home/vscode/install-vscode-extension*.sh \
  && su - vscode -c /home/vscode/install-vscode-Go.sh

WORKDIR /root
CMD su - vscode -c "code -w ."
