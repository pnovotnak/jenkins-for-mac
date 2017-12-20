FROM jenkins/jenkins

ENV DOCKER_CLIENT_REPO=https://download.docker.com/linux/static/stable/x86_64
ENV PATH=$PATH:/opt/docker
ENV DOCKER_HOST=unix:///tmp/docker.sock

USER root
# Allow us to do this: https://github.com/docker/for-mac/issues/483#issuecomment-344901087
RUN apt-get update \
  && apt-get install -qy netcat-openbsd \
  && rm -rf /var/lib/apt/lists/*
# Install docker client
RUN ARCHIVE=$(curl -L "$DOCKER_CLIENT_REPO" \
  | sed 's/^.*href="//g; s/\".*$//' \
    | grep 'docker.*.tgz' \
      | sort -n \
        | tail -n 1) \
  && curl "$DOCKER_CLIENT_REPO/$ARCHIVE" > /tmp/docker.tgz \
  && mkdir -p /opt/docker \
  && tar -C /opt/docker --strip=1 -xf /tmp/docker.tgz
USER jenkins

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/entrypoint.sh", "/usr/local/bin/jenkins.sh"]

