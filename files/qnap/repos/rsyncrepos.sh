#!/bin/bash

lockfile="/var/lock/subsys/rsync_updates"

localroot="/share/QDownload/repos"

mirror="mirrors.ircam.fr"
mirrorcentosdir="pub/CentOS"
mirrorepeldir="pub/fedora/epel"
mirrorfedoradir="pub/fedora/linux"

if [ -f $lockfile ]; then
    echo "========================================="
    echo "ERROR Updates via rsync already running."
    echo "========================================="
    exit 0
fi

if [ -d $localroot/centos ] ; then
    echo "========================================="
    echo "Syncing $localroot/centos"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" $mirror::$mirrorcentosdir/RPM* $localroot/centos/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/centos"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/centos not present."
fi

if [ -d $localroot/centos/6.10 ] ; then
    echo "========================================="
    echo "Syncing $localroot/centos/6.10/"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" $mirror::$mirrorcentosdir/6.10/ $localroot/centos/6.10/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/centos/6.10 not present."
fi

if [ -d $localroot/centos/7.5.1804 ] ; then
    echo "========================================="
    echo "Syncing $localroot/centos/7.5.1804/"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" $mirror::$mirrorcentosdir/7.5.1804/ $localroot/centos/7.5.1804/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/centos/7.5.1804/"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/centos/7.5.1804 not present."
fi

if [ -d $localroot/epel ] ; then
    echo "========================================="
    echo "Syncing $localroot/epel"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" --exclude "ppc64" $mirror::$mirrorepeldir/RPM-GPG-KEY-EPEL* $localroot/epel/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/epel"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/epel not present."
fi

if [ -d $localroot/epel/6Server ] ; then
    echo "========================================="
    echo "Syncing $localroot/epel/6Server"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" --exclude "ppc64" $mirror::$mirrorepeldir/6Server/ $localroot/epel/6Server/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/epel/6Server"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/epel/6Server not present."
fi

if [ -d $localroot/epel/7Server ] ; then
    echo "========================================="
    echo "Syncing $localroot/epel/7Server"
    echo "========================================="
    touch $lockfile
    rsync  -avSHP --delete --exclude "local*" --exclude "ppc64" $mirror::$mirrorepeldir/7Server/ $localroot/epel/7Server/
    rm -f $lockfile
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/epel/7Server"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/epel/7Server not present."
fi 

if [ -d $localroot/epel/6 ] ; then
    echo "========================================="
    echo "Syncing $localroot/epel/6"
    echo "========================================="
    touch /var/lock/subsys/rsync_updates
    rsync  -avSHP --delete --exclude "local*" --exclude "ppc64" $mirror::$mirrorepeldir/6/ $localroot/epel/6/
    rm -f /var/lock/subsys/rsync_updates
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/epel/6"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/epel/6 not present."
fi 

if [ -d $localroot/epel/7 ] ; then
    echo "========================================="
    echo "Syncing $localroot/epel/7"
    echo "========================================="
    touch /var/lock/subsys/rsync_updates
    rsync  -avSHP --delete --exclude "local*" --exclude "ppc64" --exclude "aarch64" --exclude "ppc64le" $mirror::$mirrorepeldir/7/ $localroot/epel/7/
    rm -f /var/lock/subsys/rsync_updates
    echo "+++++++++++++++++++++++++++++++++++++++++"
    echo "Done Syncing $localroot/epel/7"
    echo "+++++++++++++++++++++++++++++++++++++++++"
else
    echo "Target directory $localroot/epel/7 not present."
fi

echo "========================================="
echo "Syncing Fedora"
echo "========================================="

for version in 28; do

    if [ -d $localroot/fedora/releases/$version ] ; then
        echo "========================================="
        echo "Syncing $localroot/fedora/releases/$version"
        echo "========================================="
        touch /var/lock/subsys/rsync_updates
        rsync  -avSHP --delete --exclude "local*" --exclude "aarch64" --exclude "armhfp" $mirror::$mirrorfedoradir/releases/$version/ $localroot/fedora/releases/$version/
        rm -f /var/lock/subsys/rsync_updates
        echo "+++++++++++++++++++++++++++++++++++++++++"
        echo "Done Syncing $localroot/fedora/releases/$version"
        echo "+++++++++++++++++++++++++++++++++++++++++"
    else
        echo "Target directory $localroot/fedora/releases/$version not present."
    fi

    if [ -d $localroot/fedora/updates/$version ] ; then
        echo "========================================="
        echo "Syncing $localroot/fedora/updates/$version"
        echo "========================================="
        touch /var/lock/subsys/rsync_updates
        rsync  -avSHP --delete --exclude "local*" --exclude "aarch64" --exclude "armhfp" $mirror::$mirrorfedoradir/updates/$version/ $localroot/fedora/updates/$version/
        rm -f /var/lock/subsys/rsync_updates
        echo "+++++++++++++++++++++++++++++++++++++++++"
        echo "Done Syncing $localroot/fedora/updates/$version"
        echo "+++++++++++++++++++++++++++++++++++++++++"
    else
        echo "Target directory $localroot/fedora/updates/$version not present."
    fi
done

echo "+++++++++++++++++++++++++++++++++++++++++"
echo "Done Syncing Fedora"
echo "+++++++++++++++++++++++++++++++++++++++++"

