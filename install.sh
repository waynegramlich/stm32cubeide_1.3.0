#!/bin/bash
INSTALL_SH_NAME=/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh
ZIP_NAME=/tmp/stm32cubeide.sh.zip
STM32CUBIEIDE_DIRECTORY=/opt/st/stm32cubeide_1.3.0
STM32CUBIEIDE_EXECUTABLE=$STM32CUBIEIDE_DIRECTORY/stm32cubeide
if [ -d "$EXEC_NAME" ]
then
    echo "The stm32cubeide is already installed."
else
    echo "Creating $ZIP_NAME in /tmp ."
    cat splits/* > $ZIP_NAME
    echo "Unzipping $ZIP_NAME into /tmp"
    time unzip $ZIP_NAME -d /tmp
    echo "The installation is starting. "
    echo "Installation generates a bunch of license prompts and asks for your sudo password."
    chmod +x $INSTALL_SH_NAME
    sudo $INSTALL_SH_NAME
    echo "================"
    echo "Installation is complete."
    echo "Executable is at $STM32CUBIEIDE_EXECUTABLE ."
fi
