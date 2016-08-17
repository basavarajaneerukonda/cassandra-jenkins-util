#!/bin/sh -xe
[ -z $PARTITION ] && PARTITION="sda2"
MOUNTPOINT="/mnt"
if grep $PARTITION /proc/partitions; then
    sudo umount $MOUNTPOINT || /bin/true
    sudo mkfs.ext4 /dev/$PARTITION
    [ -d $MOUNTPOINT ] || sudo mkdir $MOUNTPOINT
    sudo mount /dev/$PARTITION $MOUNTPOINT
    sudo mkdir $MOUNTPOINT/tmp
    sudo chmod 777 $MOUNTPOINT/tmp
    echo "Done Setting Up Data Disk."
else
    echo "Data Partition Not Found!"
fi

exit 0
