FROM ubuntu:18.04

RUN apt-get update && apt-get upgrade -y

# yes... need both python2 and python3
# native dev libraries are needed for the configurator to correctly detect them
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libtool \
    automake \
    git \
    gcc-aarch64-linux-gnu \
    libc6-dev-arm64-cross \
    gcc-arm-linux-gnueabihf \
    libc6-dev-armhf-cross \
    qemu-user-static \
    python \
    python3-mako \
    wget \
    gettext \
    libgmp-dev \
    libsqlite3-dev \
    libz-dev

ADD ports.list /etc/apt/sources.list.d/

RUN dpkg --add-architecture arm64
RUN dpkg --add-architecture armhf

RUN sed -i 's/deb /deb [arch=amd64] /' /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
    libgmp-dev:arm64 \
    libgmp-dev:armhf \
    libsqlite3-dev:arm64 \
    libsqlite3-dev:armhf \
    libz-dev:arm64 \
    libz-dev:armhf


CMD ./compile.sh
