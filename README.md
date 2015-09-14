# docker-rust

Public trusted images available on:

* [Docker Hub](https://registry.hub.docker.com/u/dlecan/rust-cross-armhf/)

This repository is used to build a Docker image based on Ubuntu for the Rust programming language for i686, x86_64 and armhf (eg. : Raspberry Pi) architectures and a few supporting tools. The image includes :
- `rustc`
- `rustdoc`
- `cargo`
- `git`
- SSL certificates
- build essentials
- Linaro cross compiler for ARMHF

So it should be able to run `cargo build` on most projects out of the box. The path `/source` is a volume where you can mount a Cargo project from the host machine.

## Why ?

To setup a full cross-compiling environment is hard. You need (thanks to https://github.com/japaric/ruststrap/blob/master/1-how-to-cross-compile.md):
- a build toolchain for armhf architecture : not available on Debian, but easy to install on Ubuntu
- a Rust compiler for armhf architecture : no binaries are available, so you need to compile it from sources
- to tell Cargo how to cross compile
- to configure your packet manager to handle `armhf` packages : available through [http://ports.ubuntu.com/](http://ports.ubuntu.com/)
- to install developpement libraries for armhf architecture (and not for i686 or x86_64)

After that, if you succeed (Linaro compiler is boggus on Ubuntu Trusty), your workstation will be a real mess.

So I created this Docker image to Rust cross-compilation on armhf as simple as: `cargo-arm build`

## Usage

The following command will drop you into a Bash shell with the current directory on the host shared. From there you can run `rustc`, `rustdoc`, and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source dlecan/rust-armhf
```

## License

[MIT](http://opensource.org/licenses/MIT)
