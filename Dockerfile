FROM debian:bullseye

# Install common utilities
RUN set -ex && \
    apt-get update && \
    apt-get -qqy install wget curl tar unzip tree git p7zip-full

# Prefer IPv6 to IPv4
RUN set -ex && \
    echo 'label 2002::/16   2' >> /etc/gai.conf

# C/C++
RUN set -ex && \
    apt-get -qqy install build-essential binutils

# Python
RUN set -ex && \
    apt-get -qqy install python3 python2

# Golang
RUN set -ex && \
    wget https://github.com/voidint/g/releases/download/v1.2.1/g1.2.1.linux-arm64.tar.gz && \
    ./g install 1.18 && \
    rm g

# Rust
RUN set -ex && \
    wget https://raw.githubusercontent.com/rust-lang/rustup/master/rustup-init.sh && \
    chmod +x rustup-init.sh && \
    ./rustup-init.sh -y --no-modify-path --profile minimal && \
    rm rustup-init.sh

# Ruby
RUN set -ex && \
    apt-get -qqy install ruby-full

USER pi
WORKDIR /home/pi
