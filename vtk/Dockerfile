# -*- docker-image-name: "ashgillman/vtk" -*-
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
    libqt4-dev \
    libvtk6-dev \
    make

# Load SMILI
ENV VTK_VER v6.3.0
RUN mkdir /vtk \
    && curl -L https://github.com/Kitware/VTK/archive/${VTK_VER}.tar.gz \
    | tar xz -C vtk --strip-components 1

# Build ITK
RUN mkdir /vtk/build \
    && cd /vtk/build \
    && cmake /vtk \
       -DCMAKE_BUILD_TYPE=Release \
       -DBUILD_EXAMPLES=ON \
       -DBUILD_SHARED_LIBS=ON \
       -DBUILD_TESTING=ON \
       -DCMAKE_INSTALL_PREFIX=/usr/local \
    && make -j$(nproc)

# Install ITK
RUN cd /vtk/build \
    && make install

# Put binaries on path
ENV PATH $PATH:/vtk/build/bin
