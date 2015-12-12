#!/bin/bash

RUST_VERSION=1.5.0

docker build -t dlecan/rust-x86_64-armv6 rust-x86_64-armv6

docker tag dlecan/rust-x86_64-armv6:latest dlecan/rust-x86_64-armv6:$RUST_VERSION

docker push dlecan/rust-x86_64-armv6
