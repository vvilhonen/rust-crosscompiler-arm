FROM ubuntu:vivid
MAINTAINER Damien Lecan <dev@dlecan.com>

ENV USER root
ENV RUST_VERSION 1.2.0
ENV CC arm-linux-gnueabihf-gcc
ENV PATH /opt/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin:$PATH
# Plus nécessaire ?
ENV CFLAGS -I/usr/include -I/usr/include/arm-linux-gnueabihf

COPY include/sources.list /etc/apt/
COPY include/sources-armhf.list /etc/apt/sources.list.d/
COPY include/config /root/.cargo/
COPY include/arm-linux-gnueabihf-gcc-with-link-search /usr/local/sbin/

RUN dpkg --add-architecture armhf && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    libssl-dev:armhf && \
  curl -s https://static.rust-lang.org/dist/rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz \
  | tar -xz && \
  ./rust-$RUST_VERSION-x86_64-unknown-linux-gnu/install.sh --without=rust-docs && \
  curl -sL https://www.dropbox.com/s/viq9knkkfbtk74k/rustlib-arm-unknown-linux-gnueabihf.tar.gz?dl=1 \
  | tar -xzC /usr/local/lib/rustlib && \
  git clone --depth=1 https://github.com/raspberrypi/tools.git && \
  mv tools/arm-bcm2708 /opt && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl git && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    rust-$RUST_VERSION-x86_64-unknown-linux-gnu \
    tools \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir -p /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]
