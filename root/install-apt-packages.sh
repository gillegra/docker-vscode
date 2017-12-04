#!/bin/sh
apt-get update \
&& apt-get install -y --no-install-recommends unzip \
  libgtk2.0-0 libxss1 libx11-xcb1 libxtst6 libasound2 \
  libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 \
&& curl -o vscode-amd64.deb -L https://go.microsoft.com/fwlink/?LinkID=760868 \
&& dpkg -i vscode-amd64.deb