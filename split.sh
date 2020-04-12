#!/bin/bash
ORIGINAL_ZIP_FILE=en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh.zip
SPLIT_PREFIX=stm32cubeide_1.3.0_install.sh.zip.
SPLITS_DIRECTORY=splits
mkdir -p $SPLITS_DIRECTORY
(cd $SPLITS_DIRECTORY ; split -d --bytes=50M ../$ORIGINAL_ZIP_FILE $SPLIT_PREFIX)

