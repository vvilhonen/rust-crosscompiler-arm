#!/bin/bash

RUST_VERSION=1.6.0

docker build -t dlecan/rust-x86_64-armv6 rust-x86_64-armv6

docker tag -f dlecan/rust-x86_64-armv6:latest dlecan/rust-x86_64-armv6:$RUST_VERSION
docker tag -f dlecan/rust-x86_64-armv6:latest dlecan/rust-x86_64-armv6:stable

docker push dlecan/rust-x86_64-armv6
