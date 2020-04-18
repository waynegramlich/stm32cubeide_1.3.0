#!/bin/bash

# This script takes the contents of the `splits/` directory, assembles a ZIP_NAME in the `/tmp/`
# directory, and then unpacks that into `/tmp/stm32cubeide.sh`.  This script can be executed
# under `sudo` to perform the final installation.  This process preserves the prompting of the
# two click through licenses.

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
    rm -f $INSTALL_SH_NAME
    time unzip $ZIP_NAME -d /tmp
    echo "The installation is starting. "
    chmod +x $INSTALL_SH_NAME
    echo ""
    echo "The final installation must be run under`sudo` to install a bunch of system files."
    echo 'Depending upon how recently you ran `sudo`, it may prompt you for your login password.'
    echo "Next, the installation script will display two two license agreements for you to"
    echo 'accept by typing `y`.  If you do not type `y` to both agreements, the software will'
    echo "not be installed.  The final executable is installed at $STM32CUBIEIDE_EXECUTABLE ."
    echo ""
    echo 'Please type `sudo /tmp/stm32cube.sh` to finalize installation.'
fi
