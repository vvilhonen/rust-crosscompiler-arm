#!/bin/bash

docker run -it --rm \
	-v $(pwd):/source \
	-v ~/.cargo/git:/root/.cargo/git \
	-v ~/.cargo/registry:/root/.cargo/registry \
	dlecan/rust-x86_64-armv6

sudo chown -R `stat -c %u:%g $HOME` $(pwd) ~/.cargo