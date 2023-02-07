#!/bin/bash

. function.sh

BAR

CODE [U-19] finger 서비스 비활성화		

cat << EOF >> $result

[양호]: Finger 서비스가 비활성화 되어 있는 경우

[취약]: Finger 서비스가 활성화 되어 있는 경우

EOF

BAR

# Check if backup file exists
if [ -f /etc/xinetd.d/finger.bak ]
then
    # Restore original file from backup
    sudo mv /etc/xinetd.d/finger.bak /etc/xinetd.d/finger
    OK "Original configuration of the Finger service restored from backup."
else
    WARN "Backup file of original configuration not found."
fi

cat $result

echo ; echo
