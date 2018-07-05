#!/bin/bash
set -e

mkdir /build/release
cd /build/release

#cmake /build/QGIS \
#    -GNinja \
#	-DWITH_STAGED_PLUGINS=OFF \
#	-DCMAKE_INSTALL_PREFIX=/usr \
#	-DWITH_GRASS=ON \
#	-DSUPPRESS_QT_WARNINGS=ON \
#	-DENABLE_TESTS=OFF \
#	-DWITH_QSPATIALITE=ON \
#	-DWITH_QWTPOLAR=OFF \
#	-DWITH_APIDOC=OFF \
#	-DWITH_ASTYLE=OFF \
#	-DWITH_DESKTOP=ON \
#	-DWITH_BINDINGS=ON \
#	-DDISABLE_DEPRECATED=ON 

#ninja install

cmake -G "Unix Makefiles" /build/QGIS \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DENABLE_TESTS=FALSE \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_INTERNAL_{HTTPLIB2,JINJA2,MARKUPSAFE,OWSLIB,PYGMENTS,DATEUTIL,PYTZ,YAML,NOSE2,SIX,FUTURE}=FALSE \
    -DWITH_GEOREFERENCER=TRUE \
    -DWITH_3D=TRUE
#    -DWITH_SERVER=TRUE \
#    -DWITH_GLOBE=TRUE

make
make install
