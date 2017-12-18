# https://github.com/ctaggart/golang-vscode
# https://hub.docker.com/r/ctaggart/golang-vscode/

# https://golang.org/
# https://hub.docker.com/_/golang/
# https://github.com/docker-library/golang

# FROM ubuntu:16.04
FROM golang:latest

LABEL maintainer="gillegra@gmail.com" \
  org.label-schema.name="docker-vscode" \
  org.label-schema.version="1.1" \
  org.label-schema.description="A simple base environment to use for development. Only requirements are to include Visual Studio Code, an X window client, and a Docker engine." \
  org.label-schema.license="MIT" \
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
  \
  && su - vscode -c "code --install-extension Shan.code-settings-sync" \
  && su - vscode -c "code --install-extension lukehoban.go" \
  && export GOPATH=$HOME/go \
  && echo 'export PATH=~/go/bin:/usr/local/go/bin:$PATH' >> ~/.bash_profile \
  && . ~/.bash_profile \
  && go get -u -v github.com/ramya-rao-a/go-outline \
  && go get -u -v github.com/acroca/go-symbols \
  && go get -u -v github.com/nsf/gocode \
  && go get -u -v github.com/rogpeppe/godef \
  && go get -u -v golang.org/x/tools/cmd/godoc \
  && go get -u -v github.com/zmb3/gogetdoc \
  && go get -u -v github.com/golang/lint/golint \
  && go get -u -v github.com/fatih/gomodifytags \
  && go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs \
  && go get -u -v golang.org/x/tools/cmd/gorename \
  && go get -u -v sourcegraph.com/sqs/goreturns \
  && go get -u -v github.com/cweill/gotests/... \
  && go get -u -v golang.org/x/tools/cmd/guru \
  && go get -u -v github.com/josharian/impl \
  && go get -u -v github.com/haya14busa/goplay/cmd/goplay \
  && go get github.com/derekparker/delve/cmd/dlv

ENTRYPOINT [ "su", "-", "vscode", "-c" ]
CMD [ "code -w" ]
