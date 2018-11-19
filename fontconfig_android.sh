#!/bin/bash

. abi_settings.sh $1 $2 $3

#pushd fontconfig

echo ${BASEDIR}
cd ${BASEDIR}/fontconfig
make clean

#autoreconf -ivf

#./configure \
./autogen.sh \
  --with-pic \
  --host=arm-linux \
  --with-freetype-config=${INSTALL_PREFIX} \
  --disable-shared \
  --enable-static \
  --disable-libxml2 \
  --prefix="${INSTALL_PREFIX}" \
  --disable-iconv || exit 1

make -j${NUMBER_OF_CORES} install || exit 1

#popd
