FROM debian:jessie
MAINTAINER Damien Lecan <dev@dlecan.com>

#ENV USER root
ENV RUST_VERSION 1.6.0

ENV CC_DIR /opt/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin
ENV REAL_CC $CC_DIR/arm-linux-gnueabihf-gcc
ENV CC arm-linux-gnueabihf-gcc-with-link-search
ENV PATH $CC_DIR:$PATH
ENV ROOT_FS /opt/rpi-fs

COPY include/config /tmp/.cargo/
COPY include/arm-linux-gnueabihf-gcc-with-link-search /usr/local/sbin/
COPY include/fixQualifiedLibraryPaths.sh /usr/local/sbin/
COPY include/cargo /usr/local/sbin/

RUN mv /tmp/.cargo $HOME && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    file \
    curl && \
  curl -sSL https://github.com/dlecan/rust-armv6-dependencies/raw/master/rust-$RUST_VERSION-arm-unknown-linux-gnueabihf.tar.gz \
  | tar -xzC /usr/local/ --strip=1 && \
  curl -sSL https://github.com/raspberrypi/tools/archive/master.tar.gz \
  | tar -zxC /opt tools-master/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64 --strip=2 && \
  mkdir -p $ROOT_FS && \
  curl -sSL https://github.com/dlecan/rust-armv6-dependencies/raw/master/2015-09-15_rpi-root.tar.gz \
  | tar -xzC $ROOT_FS && \
  fixQualifiedLibraryPaths.sh $ROOT_FS $REAL_CC && \
  ln -s $ROOT_FS/lib/arm-linux-gnueabihf /lib/arm-linux-gnueabihf && \
  ln -s $ROOT_FS/usr/lib/arm-linux-gnueabihf /usr/lib/arm-linux-gnueabihf && \
  DEBIAN_FRONTEND=noninteractive apt-get remove --purge -y curl && \
  DEBIAN_FRONTEND=noninteractive apt-get autoremove -y && \
  rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* && \
  mkdir -p /source

VOLUME ["/root/.cargo/git", "/root/.cargo/registry"]

VOLUME ["/source"]
WORKDIR /source

CMD ["cargo", "build", "--release"]
