FROM dlecan:rust-cross-armhf
MAINTAINER Damien Lecan <dev@dlecan.com>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    libssl-dev \
    libssl-dev:armhf && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir -p /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]
