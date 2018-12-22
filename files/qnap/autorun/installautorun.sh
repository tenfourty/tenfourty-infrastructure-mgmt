#!/bin/sh

# Install autorun.sh into the configuration partition of a QNap (Intel based)

echo "Mounting config partition: mount -t ext2 /dev/sdx6 /tmp/config"
mount $(/sbin/hal_app --get_boot_pd port_id=0)6 /tmp/config

echo "Copying autorun.sh into place"
cp ./autorun.sh /tmp/config/autorun.sh

echo "Setting autorun.sh to executable"
chmod +x /tmp/config/autorun.sh

echo "Unmounting config partition"
umount /tmp/config

echo "Done."
