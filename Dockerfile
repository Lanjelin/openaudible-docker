FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbullseye

LABEL maintainer="lanjelin"
ENV TITLE=OpenAudible
ENV OA_VERSION=3.8.1

RUN \
  sed -i 's|</applications>|  <application title="OpenAudible" type="normal">\n    <maximized>no</maximized>\n  </application>\n</applications>|' /etc/xdg/openbox/rc.xml && \
  echo "**** update packages ****" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      wget \
      gnome-icon-theme* \
      thunar && \
  echo "**** installing OpenAudible ****" && \
    wget -q https://github.com/openaudible/openaudible/releases/download/v${OA_VERSION}/OpenAudible_${OA_VERSION}_x86_64.sh && \
    sh ./OpenAudible_${OA_VERSION}_x86_64.sh -q && \
    rm OpenAudible_${OA_VERSION}_x86_64.sh && \
  echo "**** cleanup ****" && \
    rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/*

COPY /root /

EXPOSE 3000 3001

VOLUME /config
