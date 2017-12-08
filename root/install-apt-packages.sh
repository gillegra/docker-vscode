#!/bin/sh
#set up the docker repository and then install the docker engine
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add - \
: <<COMMENT \
#should check the key fingerprint? \
COMMENT \
&& add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable" \
\
&& apt-get update \
&& apt-get install docker-ce \
\
: <<COMMENT \
#install vscode and its dependencies
COMMENT \
&& apt-get install -y --no-install-recommends unzip \
  libgtk2.0-0 libxss1 libx11-xcb1 libxtst6 libasound2 \
  libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 \
&& curl -o vscode-amd64.deb -L https://go.microsoft.com/fwlink/?LinkID=760868 \
&& dpkg -i vscode-amd64.deb