#!/bin/bash

case "$1" in

#cleanup
"cleanup")
echo "cleaning..."
        brew list | xargs brew uninstall
        brew cleanup
        ;;

#uninstaller
"uninstall")
echo "uninstalling and cleaning up!"
        rm -rf images/disk
        brew uninstall nasm qemu cmake mtools x86_64-elf-gcc
        ;;

#clear up cached data and free up space from HomeBrew
"hardclean")
echo "hard cleaning..."
     rm -rf images/disk
     brew list | xargs brew uninstall
     brew remove --force --ignore-dependencies $(brew list)
     brew cleanup -s
     brew cleanup
        ;;
    *)
        # Display a usage message when an invalid command is provided
        echo "Usage: ./uninstall.sh commandname"
        ;;
esac