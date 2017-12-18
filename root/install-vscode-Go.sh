#!/bin/sh
dir=$(cd `dirname "$0"` && pwd)
# publisher extension version
su - vscode -c "code --install-extension lukehoban.go"

#see https://github.com/ctaggart/golang-vscode/issues/8
# echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
# echo 'export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH' >> ~/.bash_profile
export GOPATH=$HOME/go
echo 'export PATH=~/go/bin:/usr/local/go/bin:$PATH' >> ~/.bash_profile
. ~/.bash_profile

#https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay

#https://github.com/derekparker/delve/blob/master/Documentation/installation/linux/install.md
go get github.com/derekparker/delve/cmd/dlv