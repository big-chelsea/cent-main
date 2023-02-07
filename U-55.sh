#!/bin/bash

 

. function.sh
 

BAR

CODE [U-55] hosts.lpd 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: 파일의 소유자가 root이고 권한이 600인 경우

[취약]: 파일의 소유자가 root가 아니고 권한이 600이 아닌 경우

EOF

BAR

 
TMP1=`SCRIPTNAME`.log

> $TMP1

# Backup the original hosts.lpd file
sudo cp /etc/hosts.lpd /etc/hosts.lpd.bak

# Restore the original hosts.lpd file
sudo cp /etc/hosts.lpd.bak /etc/hosts.lpd

# Remove the backup file
sudo rm -rf /etc/hosts.lpd.bak


cat $result

echo ; echo
