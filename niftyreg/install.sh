#!/usr/bin/env bash

# Installs Nifty Reg with (my) preferred options. Expects environment variables
# NIFTY_DIR, NIFTY_VER and NIFTY_SRC to be set.
# Also accepts arguments:
# --no-build  Don't actually perform the build, just pull sources
# --no-clean  Don't remove the sources after building. No effect if
#             --no-build is specified.

while [[ $# > 1 ]]; do
  key="$1"

  case $key in
      --no-build)
      BUILD=NO
      ;;
      --no-clean)
      CLEAN=NO
      ;;
      *)
              # unknown option
      ;;
  esac
  shift
done

BUILD_PACKAGES=" \
    build-essential \
    cmake-curses-gui \
    curl"

RUNTIME_PACKAGES="\
    libpng12-dev \
    zlib1g-dev"

apt-get update
apt-get install -qy $BUILD_PACKAGES $RUNTIME_PACKAGES

mkdir -p $NIFTY_SRC
if [ ! -s "${NIFTY_SRC}/CMakeLists.txt" ]; then
  echo "Downloading http://sourceforge.net/projects/niftyreg/files/nifty_reg-${NIFTY_VER}/nifty_reg-${NIFTY_VER}.tar.gz/download"
  curl -L http://sourceforge.net/projects/niftyreg/files/nifty_reg-${NIFTY_VER}/nifty_reg-${NIFTY_VER}.tar.gz/download \
    | tar xz -C $NIFTY_SRC --strip-components 1
fi

mkdir -p $NIFTY_DIR
cd $NIFTY_DIR
cmake $NIFTY_SRC \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr/local
    #-DUSE_DOUBLE=ON \

if [ "$BUILD" != NO ]; then
  make -j$(nproc)
  make install
  ldconfig

  if [ "$CLEAN" != NO ]; then
    echo "CLEAN: $CLEAN"
    rm -r $NIFTY_SRC
    rm -r $NIFTY_DIR
    #apt-get purge -y $BUILD_PACKAGES $(apt-mark showauto)
    apt-get purge -y $BUILD_PACKAGES
    apt-get autoremove
    apt-get clean
    rm -rf /var/lib/apt/lists/*
  fi
fi
