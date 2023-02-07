#!/bin/bash

 

. function.sh

 

BAR

CODE [U-65] at 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: at 접근제어 파일의 소유자가 root이고, 권한이 640 이하인 경우

[취약]: at 접근제어 파일의 소유자가 root가 아니거나, 권한이 640 이하가 아닌 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1



# Restore original permissions of /usr/bin/at
sudo chmod 755 /usr/bin/at
OK "Restored original permissions of /usr/bin/at"

# Restore original owner and permissions of /etc/at.deny
sudo chown root:root /etc/at.deny
sudo chmod 644 /etc/at.deny
OK "Restored original owner and permissions of /etc/at.deny"



cat $result

echo ; echo 