#!/bin/bash
set -e

cd /build

git clone --depth 1 -b release-3_2 git://github.com/qgis/QGIS.git

cd QGIS
