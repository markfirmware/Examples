#!/bin/bash
set -e

LPINAME=HelloWorld
MODES="QEMUVPB RPI RPI2 RPI3"

function buildmode {
    MODE=$1
    echo $MODE
    rm -rf lib/ *.elf kernel*.img kernel.bin
    WD=$(pwd)
    pushd /c/Ultibo/Core >& /dev/null
    ./lazbuild --build-mode=BUILD_MODE_$MODE $WD/$LPINAME.lpi
    popd >& /dev/null
}

for MODE in $MODES
do
    buildmode $MODE
done
