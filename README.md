# STM32CubeID Version 1.3.0

This is a ***VERY TEMPORARY*** snap shot of the STM32CubeIDE Version 1.3.0 Linux Debian
installation file from [ST Microelectronics](https://my.st.com).  This repository will be
deleted when the next version of the STM32CubeIDE is released.  This is a convenience
repository so that this software can be installed a little bit more easily than downloading
the software directly from ST.

Go to some convenient directory location for cloning a repository under:

     cd somewhere....
     git clone https://github.com/waynegramlich/stm32cubeide_1.3.0.git
     cd stm32cubeide_1.3.0
     ./install_stme32cubeide.sh

What this does concatenate the contents of the `splits` directory and into a single `.zip`
file in the `/tmp` directory.  The file `.zip` is unpacked into a `.sh` file with a long name.
This `.sh` file is executed to install the software in the `/opt/st/stm32cubeide_1.3.0`
directory.  The unpacked `.sh` file needs root access to run the `dpkg -i` command, so it
will prompt you for your login password.

<!--

Maybe next time around:

* Create the software as follows:
     # Install the software in /opt/st using the installation script.
     (cd /opt/st ; tar stm32cubeide_x.y.z | bzip2 > /tmp/stm32cubeide_x.y.z.tar.bz2 )
     rm -rf splits
     mkdir -p splits
     (cd splits ; split -d --bytes=50M /tmp/stm32cubeide_x.y.z.tar.bz2 stme32cubide_x.y.z.tar.bz2. )
* Unpack as follows:
     rm -rf stm32cubeide_x.y.z
     cat splits/*.tar.bz2.* | bunzip2 | tar xf -
     # Make sure that stm32cubeide_x.y.z is in .gitignore
     # Figure out how to ensure that it can be executed from hr2 environment.

-->