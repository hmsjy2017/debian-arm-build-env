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
    apt-get -qqy install golang

# Rust
RUN set -ex && \
    wget -O /root/rustup-init.sh https://raw.githubusercontent.com/rust-lang/rustup/master/rustup-init.sh && \
    chmod +x /root/rustup-init.sh && \
    ./root/rustup-init.sh -y --no-modify-path --profile minimal && \
    rm /root/rustup-init.sh

# Ruby
RUN set -ex && \
    apt-get -qqy install ruby-full

USER pi
WORKDIR /home/pi
