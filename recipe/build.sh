#!/bin/sh
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="$LDFLAGS -L${PREFIX}/lib"
export CXXINTRINSICS="-msse2 -msse3 -msse4 -mpopcnt"

ln -s $PREFIX/lib/libmve.a mve/libs/mve
ln -s $PREFIX/lib/libmve_dmrecon.a mve/libs/dmrecon
ln -s $PREFIX/lib/libmve_fssr.a mve/libs/fssr
ln -s $PREFIX/lib/libmve_ogl.a mve/libs/ogl
ln -s $PREFIX/lib/libmve_sfm.a mve/libs/sfm
ln -s $PREFIX/lib/libmve_util.a mve/libs/util

cd smvs
make -j${CPU_COUNT}

cp smvsrecon ${PREFIX}/bin

find . -name "*.a" -exec cp {} ${PREFIX}/lib \;
