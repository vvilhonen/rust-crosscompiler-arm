#!/bin/bash

USERNAME=dlecan
IMAGE_PATH=arm
IMAGE_NAME=$IMAGE_PATH
IMAGE=$USERNAME/rust-crosscompiler-arm

RUST_CHANNEL=stable

docker build -t $IMAGE:$RUST_CHANNEL $IMAGE_PATH

docker push $IMAGE
