#!/bin/bash

. function.sh

BAR

CODE [U-25] NFS 접근 통제		

cat << EOF >> $result

[양호]: 불필요한 NFS 서비스를 사용하지 않거나, 불가피하게 사용 시 everyone 
공유를 제한한 경우

[취약]: 불필요한 NFS 서비스를 사용하고 있고, everyone 공유를 제한하지 않은 
경우

EOF

BAR

# Start the NFS service
sudo service nfs start

# Re-export all NFS file systems
sudo exportfs -rav

# Restart the NFS service
sudo service nfs restart


cat $result

echo ; echo
