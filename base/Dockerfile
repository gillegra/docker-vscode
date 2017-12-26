# https://github.com/ctaggart/golang-vscode

#Using Debian here because it provides a much more stable experience using VS Code remotely than Ubuntu (see https://github.com/electron/electron/issues/2256)
FROM buildpack-deps:stretch

LABEL maintainer="gillegra@gmail.com" \
  org.label-schema.name="docker-vscode" \
  org.label-schema.version="1.2" \
  org.label-schema.description="A simple base environment to use for development. Only requirements are to include Visual Studio Code and an X Window client. The Settings Sync extension for VS Code is included to easily persist preferences across dev environments." \
  org.label-schema.license="MIT" \
  org.label-schema.schema-version="1.0"

COPY . /root

RUN useradd -m vscode -s /bin/bash \
  && /root/install-vscode-base.sh \
  && su - vscode -c "code --install-extension Shan.code-settings-sync"

# ENTRYPOINT [ "su", "-", "vscode", "-c" ]
# CMD [ "code -w" ]
CMD [ "code -w --user-data-dir=/home/.vscode" ]
