#!/bin/bash

# This script takes the contents of the `splits/` directory, assembles `.zip` file named
# `/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh.zip`.  This file is
# then unzipped to create `/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh`
# and the execute bit is set.  This `.sh` file must be executed with `sudo` to enable the
# installation of various system files.  The `.sh` file requires typing `y` through to
# license acceptance scripts.

# Find the directory that contains this shell script.  For reference see:
#
#    https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
#
# We are using the single line solution rather than the multi-line version (which is overkill):
STM32_CUBE_IDE_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Define the other various file names:
OPT_STM32_CUBE_IDE_DIRECTORY="/opt/st/stm32cubeide_1.3.0"
OPT_STM32_CUBE_IDE_EXECUTABLE="$OPT_STM32_CUBE_IDE_DIRECTORY/stm32cubeide"
TMP_STM32_CUBE_IDE_SH="/tmp/stm32cubeide.sh"
TMP_STM32_CUBE_IDE_SH_ZIP="$TMP_STM32_CUBE_IDE_SH.zip"
TMP_STM32_CUBE_IDE_BUNDLE_SH="/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.deb_bundle.sh"
STM32_CUBE_IDE_SPLITS_DIRECTORY="$STM32_CUBE_IDE_DIRECTORY/splits"


# Down the \`\` executable:
if [ -x "$OPT_STM32_CUBE_IDE_EXECUTABLE" ]
then
    echo "The stm32cubeide is already installed."
else
    echo "Creating \`$$TMP_STM32_CUBE_IDE_SH.zip\`."
    # Clean out any previous files:
    rm -f $TMP_STM32_CUBE_IDE_BUNDLE_SH
    rm -f $TMP_STM32_CUBE_IDE_SH
    rm -f $TMP_STM32_CUBE_IDE_SH_ZIP
    
    # Build the \`$TMP_STM32_CUBE_IDE_SH_ZIP\` file from the contents of the
    #`$STM32_CUBE_IDE_DIRECTORY/splits/\` directory:
    cat $STM32_CUBE_IDE_DIRECTORY/splits/* > $TMP_STM32_CUBE_IDE_SH_ZIP

    echo "* Unzipping \`$TMP_STM32_CUBE_IDE_BUNDLE_SH\` into \`$TMP_STM32_CUBE_IDE_SH\`."
    unzip $TMP_STM32_CUBE_IDE_SH_ZIP -d /tmp
    mv $TMP_STM32_CUBE_IDE_BUNDLE_SH $TMP_STM32_CUBE_IDE_SH
    chmod +x $TMP_STM32_CUBE_IDE_SH

    # Explain to the user what comes next:
    echo ""
    echo "The final installation must be run under \`sudo\` to install a bunch of system files."
    echo "Depending upon how recently you ran \`sudo\`, it may prompt you for your login password."
    echo "Next, the installation script will display two license agreements for you to accept"
    echo "by typing \`y\`.  If you do not type \`y\` to both agreements, the software will not be"
    echo "installed.  The final executable is installed at \`$OPT_STM32_CUBE_IDE_EXECUTABLE\`."
    echo ""
    echo "Please type \`sudo $TMP_STM32_CUBE_IDE_SH\` to finalize installation."
fi
