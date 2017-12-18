#!/bin/sh
apt-get update \
&& apt-get install -y --no-install-recommends unzip \
  libgtk2.0-0 libxss1 libx11-xcb1 libxtst6 libasound2 \
  libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 \
  apt-transport-https \
\
&& dpkg -i --recursive --force-depends . \
&& apt-get update \
&& apt-get install -f -y --no-install-recommends


# #!/bin/sh
# apt-get update && apt-get install -y --no-install-recommends apt-transport-https \
# \
# && echo "Setting up Docker repo\n" \
# && mv docker.gpg /etc/apt/trusted.gpg.d/docker.gpg \
# && echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker.list \
# \
# && echo "Setting up Docker repo\n" \
# && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -\
# && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") stretch stable" \
# \
# && echo "Setting up VSCode repo\n" \
# && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
# && echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list \
# \
# && echo "Installing dependencies, Docker engine, and VSCode\n" \
# && apt-get update \
# && apt-get install -y --no-install-recommends unzip \
#   libgtk2.0-0 libxss1 libx11-xcb1 libxtst6 libasound2 \
#   libnotify4 libnss3 libxkbfile1 libgconf-2-4 libsecret-1-0 \
# \
#   docker-ce \
#   code