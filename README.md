# STM32CubeID Version 1.3.0

This is a ***VERY TEMPORARY*** snap shot of the STM32CubeIDE Version 1.3.0 Linux Debian
installation file from [ST Microelectronics](https://my.st.com).  This repository will be
deleted when the next version of the STM32CubeIDE is released.  This is a convenience
repository so that this software can be installed a little bit more easily than downloading
the software directly from ST.

The directions below presume that you have already set up your SSH keys for GitHub.Com.
If not, do so now by visiting their
(SSH Keys)(https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)
web page.

Go to some convenient directory location for cloning a repository under:

     cd somewhere....
     git clone git@github.com:waynegramlich/stm32cubeide_1.3.0.git
     cd stm32cubeide_1.3.0
     ./install_stme32cubeide.sh

What this does concatenate the contents of the `splits` directory and into a single `.zip`
file in the `/tmp` directory.  The file `.zip` is unpacked into a `.sh` file with a long name.
This `.sh` file is executed to install the software in the `/opt/st/stm32cubeide_1.3.0`
directory.  The unpacked `.sh` file needs root access to run the `dpkg -i` command, so it
will prompt you for your login password.

