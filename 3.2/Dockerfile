FROM qgis/qgis3-build-deps:release-3_2

MAINTAINER Ruaridh Williamson<ruaridh.williamson@icloud.com>
# Based off work by Denis Rouzaud<denis.rouzaud@gmail.com>, Tim Sutton<tim@kartoza.com>, and others

ENV CC=/usr/lib/ccache/clang
ENV CXX=/usr/lib/ccache/clang++
ENV QT_SELECT=5

RUN git clone --depth 1 -b release-3_2 git://github.com/qgis/QGIS.git /usr/src/QGIS

WORKDIR /usr/src/QGIS

RUN cmake \
    -GNinja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DESKTOP=ON \
    -DWITH_SERVER=ON \
    -DWITH_3D=ON \
    -DWITH_BINDINGS=ON \
    -DBINDINGS_GLOBAL_INSTALL=ON \
    -DWITH_STAGED_PLUGINS=ON \
    -DWITH_GRASS=ON \
    -DSUPPRESS_QT_WARNINGS=ON \
    -DDISABLE_DEPRECATED=ON \
    -DENABLE_TESTS=OFF \
    -DWITH_QSPATIALITE=ON \
    -DWITH_APIDOC=OFF \
    -DWITH_ASTYLE=OFF \
    -DWITH_QWTPOLAR=OFF \
  && ninja install

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && rm -rf /usr/src/QGIS \
  && rm -r /usr/share/qgis/i18n

RUN useradd --create-home --shell /bin/bash qgis

USER qgis
WORKDIR /home/qgis

CMD /usr/bin/qgis
