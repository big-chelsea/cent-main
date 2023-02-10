#!/bin/bash

. function.sh

BAR

CODE [U-24] NFS 서비스 비활성화		

cat << EOF >> $result
[양호]: 불필요한 NFS 서비스 관련 데몬이 비활성화 되어 있는 경우
[취약]: 불필요한 NFS 서비스 관련 데몬이 활성화 되어 있는 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1 

# Restore the NFS service
sudo mv /etc/rc.d/rc2.d/_S60nfs /etc/rc.d/rc2.d/S60nfs

# Start the NFS processes
/etc/init.d/nfs start

# Check if the NFS processes are running
if ps -ef | egrep "nfs|statd|lockd" | awk '{print $2}' &> /dev/null; then
  OK "NFS service restored successfully."
else
  WARN "NFS service could not be restored."
fi


cat $result

echo ; echo