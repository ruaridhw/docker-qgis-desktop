#!/bin/bash
set -e

cd /build

git clone --depth 1 -b final-3_2_0 git://github.com/qgis/QGIS.git

cd QGIS