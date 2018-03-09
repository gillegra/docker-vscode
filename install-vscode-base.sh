#!/bin/sh
apt-get update \
&& apt-get install -y --no-install-recommends unzip \
  libgtk2.0-0 libxss1 libx11-xcb1 libxtst6 libasound2 \
\
&& curl -o vscode-amd64.deb -L https://go.microsoft.com/fwlink/?LinkID=760868 \
&& dpkg -i --force-depends vscode-amd64.deb \
&& apt-get update \
&& apt-get install -f -y --no-install-recommends