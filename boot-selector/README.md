# Physical control of GRUB default boot option.

This is based on [Hardware boot selection switch](https://hackaday.io/project/179539-hardware-boot-selection-switch) which instructs on how to create a phsical switch to control the default dual-boot OS through some sort of physical means.  On reading the article and looking at the associated github repo, my face somewhat melted due to my lack of knowledge about GRUB.  The following guide is based on setting this up on Ubuntu 22.04.

## Hardware Requirements

*  1 USB stick for boot selection that you won't need to use ever again.
*  1 USB stick for creating a live image to recover from bad `grub.cfg` changes.

## Process

### Create a live image USB stick

First off, if you mess up your grub configuration, the only way to fix things is to revert your `/boot/grub/grub.cfg` file.  You can't do this from within GRUB, so create a USB stick with a live image on it then go through a fire drill of reverting the backed up `grub.cfg` in case something goes wrong.  If you plan to reinstall if things go badly, you can skip this step.

### Format your boot selection USB stick

Format your USB stick using your favorite utility.  The `Disks` app on ubuntu works quite well for this.  You can choose any name you'd like, but since I use the drive to select for windows, I named it `BootWindows`.  While you're here, also record the drive UUID, it should look something like `A1B2-C3D4`.

### Write your grub config

Grub config is a bit interesting in that you write `sh` scripts that generate grub config which also looks like `sh`, but isn't actual `sh` becuase back then people liked `sh` and thought it would be a good DSL.  `grub-mkconfig` executes (or soruces?) the scripts in `/etc/grub.d` in lexicographical order to generate the final `grub.cfg` file.


1.  Create a `/etc/grub.d/01_default_usb` file which will run just after `00_header` and override the [default](https://www.gnu.org/software/grub/manual/grub/html_node/default.html#default) environment variable.  The following will use [search](https://www.gnu.org/software/grub/manual/grub/html_node/search.html#search) to populate the `switch_drive` variable with the device that has UUID `BE8C-3883`.  Update the following by replacing the UUID with that of your USB stick and set the default based on the boot option you want to select for (NOTE: the boot menu options are zero indexed).

    ```sh
    #! /bin/sh
    set -e

    cat <<EOF
    search --fs-uuid --set switch_drive BE8C-3883
    if [ "\${switch_drive}" ] ; then
       set default="2"
    fi
    EOF
    ```

1.  Back up your grub.cfg:

    ```
    sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.bak
    ```

1.  Regenerate grub cfg

    ```
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

1.  Test it (sorta).  `grub-emu` will execute the current `grub.cfg` in a limited fashion (search won't work) to check the menu options.  Acutally testing it requires rebooting.

    ```
    grub-emu
    ```

1.  Plug in the USB stick and reboot then unplug and reboot.

## Next steps

To get a boot selection button, you can connect the USB drive to a hub or cable with a phsical swtich.
