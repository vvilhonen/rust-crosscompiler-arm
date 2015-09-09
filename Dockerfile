FROM ubuntu:vivid
MAINTAINER Damien Lecan <dev@dlecan.com>

ENV USER root
ENV RUST_VERSION=1.2.0
ENV CC=arm-linux-gnueabihf-gcc

COPY include/sources.list /etc/apt/
COPY include/sources-armhf.list /etc/apt/sources.list.d/
COPY include/cargo-config $HOME/.cargo/config

RUN dpkg --add-architecture armhf && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    libssl-dev:armhf \
    gcc-arm-linux-gnueabihf \
    libc6-dev-armhf-cross && \
  curl -s https://static.rust-lang.org/dist/rust-$RUST_VERSION-x86_64-unknown-linux-gnu.tar.gz \
  | tar -xz && \
  ./rust-$RUST_VERSION-x86_64-unknown-linux-gnu/install.sh --without=rust-docs && \
  curl -sL https://www.dropbox.com/s/viq9knkkfbtk74k/rustlib-arm-unknown-linux-gnueabihf.tar.gz?dl=1 \
  | tar -xzC /usr/local/lib/rustlib && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    rust-$RUST_VERSION-x86_64-unknown-linux-gnu \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir /source
VOLUME ["/source"]
WORKDIR /source
CMD ["/bin/bash"]
