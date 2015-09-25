# docker-rust

Public trusted images available on:

* [Docker Hub](https://registry.hub.docker.com/u/dlecan/rust-x86_64-armv6/)

This repository is used to build a Docker image based on Debian for the Rust programming language for x86_64 and armv6 (eg. : Raspberry Pi) architectures and a few supporting tools. The image includes :
- `rustc`
- `rustdoc`
- `cargo`
- `git`
- SSL certificates
- build essentials
- Linaro cross compiler
- many libraries compiled for armv6

So it should be able to run `cargo build` on most projects out of the box. The path `/source` is a volume where you can mount a Cargo project from the host machine.

## Why ?

To setup a full cross-compiling environment is complicated. You need:
- a build toolchain for armhf architecture : not available on Debian, but easy to install on Ubuntu
- a Rust compiler for armhf architecture : no binaries are available, so you need to compile it from sources
- to tell Cargo how to cross compile
- ...

After that, if you succeed, your workstation will be a real mess.

So I created this Docker image dedicated to Rust cross-compilation on armv6 as simple as: `cargo-arm build`

## Usage

The following command will drop you into a Bash shell with the current directory on the host shared. From there you can run `rustc`, `rustdoc`, and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source dlecan/rust-armhf
```

## Inspiration

- https://github.com/japaric/ruststrap/blob/master/1-how-to-cross-compile.md
- https://github.com/djmaze/armhf-ubuntu-docker
- https://github.com/sdt/docker-raspberry-pi-cross-compiler
- http://www.openframeworks.cc/setup/raspberrypi/Raspberry-Pi-Cross-compiling-guide.html
- http://exploreembedded.tumblr.com/post/115333857238/guide-to-cross-compile-qt-54-for-the-raspberry-pi
- https://github.com/twobitcircus/rpi-build-and-boot
- https://github.com/shahriman/cross-compile-tools


## License

[MIT](http://opensource.org/licenses/MIT)
