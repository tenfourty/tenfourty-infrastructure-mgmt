#!/bin/bash
#This is a script for iSCSI initiator on CentOS 7
currentTimestamp=`date +%y-%m-%d-%H:%M:%S`

yum install -y iscsi-initiator-utils
if [ $? -ne 0 ]; then
 echo "Make sure you've registered to the RHN, and have the Server subscription"
 exit 1
fi

configFile1=/etc/iscsi/initiatorname.iscsi
configFile1Backup=$configFile1.backup.${currentTimestamp}
configFile2=/etc/iscsi/iscsid.conf
configFile2Backup=$configFile2.backup.${currentTimestamp}
if [ -f $configFile1 ]; then
	echo backup $configFile1 $configFile1Backup
	cp $configFile1 $configFile1Backup
fi
if [ -f $configFile2 ]; then
	echo backup $configFile2 $configFile2Backup
	cp $configFile2 $configFile2Backup
fi

cat <<EOF > /etc/iscsi/initiatorname.iscsi
InitiatorName=iqn.1994-05.com.redhat:b6353cc669f
EOF
echo "Start iscsi service, and set it to run on startup"
systemctl start iscsi && systemctl enable iscsi
echo "Configure the initiator"


iscsiadm -m discovery -t st -p 10.10.10.4:3260

iscsiadm -m node -T iqn.2004-04.com.qnap:tvs-473:iscsi.foreman.2770b0 -p 10.10.10.4:3260 -l


echo "Print the avaliable blocks on your system"
lsblk
