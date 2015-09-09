# docker-rust

Public trusted images available on:

* [Docker Hub](https://registry.hub.docker.com/u/dlecan/rust/)

This repository is used to build a Docker image for the Rust programming language and a few supporting tools. The image includes `rustc`, `rustdoc`, `cargo`, `git`, SSL certificates, and build essentials, so it should be able to run `cargo build` on most projects out of the box. The path `/source` is a volume where you can mount a Cargo project from the host machine.

Unlike upstream project, this image is based on Ubuntu and arm toolchain is installed in order to allow cross-compilation on ARM of Rust code.

## Usage

The following command will drop you into a Bash shell with the current directory on the host shared. From there you can run `rustc`, `rustdoc`, and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source dlecan/rust
```

## License

[MIT](http://opensource.org/licenses/MIT)
