# -*- docker-image-name: "ashgillman/itk" -*-
FROM debian:jessie
MAINTAINER Ashley Gillman <ashley.gillman@csiro.au>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake-curses-gui \
    curl \
    git \
    libboost-dev \
    libcurl4-openssl-dev \
    libinsighttoolkit4-dev \
    libpython-dev \
    libvtk6-dev \
    make

# Load ITK
ENV ITK_VER v4.8.1
RUN mkdir /itk \
    && curl -L https://github.com/InsightSoftwareConsortium/ITK/archive/${ITK_VER}.tar.gz \
    | tar xz -C itk --strip-components 1

# Build ITK
RUN mkdir /itk/build \
    && cd /itk/build \
    && cmake /itk \
       -DCMAKE_BUILD_TYPE=Release \
       -DBUILD_EXAMPLES=ON \
       -DBUILD_SHARED_LIBS=ON \
       -DBUILD_TESTING=ON \
       -DCMAKE_INSTALL_PREFIX=/usr/local \
    && make -j$(nproc)

# Install ITK
RUN cd /itk/build \
    && make install

# Put binaries on path
ENV PATH $PATH:/itk/build/bin
