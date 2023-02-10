#!/bin/bash

. function.sh
 
BAR

CODE [U-61] ftp 서비스 확인

cat << EOF >> $result
[양호]: FTP 서비스가 비활성화 되어 있는 경우
[취약]: FTP 서비스가 활성화 되어 있는 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 

# Start the vsftpd service:
sudo service vsftpd start

# Enable vsftpd service startup
sudo /etc/rc.d/init.d/vsftpd start

# Start the proftp service:
sudo service proftp start

# Enable start of proftp
sudo /etc/rc.d/init.d/proftp start

# Check if vsftpd service is running
if sudo service vsftpd status | grep "running" > /dev/null; then
  OK "vsftpd service is running."
else
  WARN "vsftpd service is not running."
fi

# Check if proftp service is running
if sudo service proftp status | grep "running" > /dev/null; then
  OK "proftp service is running."
else
  WARN "proftp service is not running."
fi

cat $result

echo ; echo