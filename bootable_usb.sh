#!/usr/bin/env bash

echo "...listing all disks..."

diskutil list

echo -n "Please enter in the name of the disk you want to create a bootable USB [please remember, the USB will be erased]: "
read name

echo -n "Please enter location of .iso: "
read location

read -r -p "Are you sure you want to proceed? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])+$ ]]
then
    echo "...Unmounting disk..."

    diskutil unmountDisk $name

    echo "...creating bootable usb..."

    sudo dd if=$location of=$name bs=1m

    echo "...DONE!..."
    echo "...ejecting usb..."

    diskutil eject $name
else
    break
fi