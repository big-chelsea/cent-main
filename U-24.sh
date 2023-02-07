#!/bin/bash

. function.sh

BAR

CODE [U-24] NFS 서비스 비활성화		

cat << EOF >> $result

[양호]: 불필요한 NFS 서비스 관련 데몬이 비활성화 되어 있는 경우

[취약]: 불필요한 NFS 서비스 관련 데몬이 활성화 되어 있는 경우

EOF

BAR




# Enable NFS service at boot time
if [ -f "/etc/rc.d/rc2.d/_S60nfs" ]; then
mv /etc/rc.d/rc2.d/_S60nfs /etc/rc.d/rc2.d/S60nfs
fi

# Start NFS-related processes
for PID in $PIDs; do
kill -9 -$PID
done


cat $result

echo ; echo
