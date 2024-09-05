#!/bin/bash
SCRIPT_DIR=$(dirname $(realpath $0))
ML_DIR=$(dirname $(realpath $0))/MapleLegends
WINEPREFIX="$HOME/maplelegends_prefix" WINEARCH=win32 $SCRIPT_DIR/wine.AppImage winecfg
