#!/bin/bash

case "$1" in
    "install")
        brew install nasm qemu cmake mtools x86_64-elf-gcc
        ;;
    "build")
        make all run
        ;;
    "run")
        qemu-system-x86_64 -cdrom images/coffee-os-x86_64.iso -m 128 -drive file=images/disk.img,format=raw,index=0,media=disk -boot order=d -serial stdio
        ;;
    "clear")
    echo "Clearing the cache..."
        rm -rf images/disk
        ;;
    
    # fully set it up with one command
        "setup")
    echo "Set up configured"
        rm -rf images/disk
        brew install nasm qemu cmake mtools x86_64-elf-gcc
        make all run
        qemu-system-x86_64 -cdrom images/coffee-os-x86_64.iso -m 128 -drive file=images/disk.img,format=raw,index=0,media=disk -boot order=d -serial stdio
        chmod +x uninstall.sh
        ;;
    *)
        # Display a usage message when an invalid command is provided
        echo "Usage: ./coffee.sh commandname"
        ;;
esac
