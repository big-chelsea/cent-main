#!/bin/bash

. function.sh

BAR

CODE [U-09] /etc/hosts 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: /etc/hosts 파일의 소유자가 root이고, 권한이 600인 이하경우

[취약]: /etc/hosts 파일의 소유자가 root가 아니거나, 권한이 600 이상인 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore original owner and group information for /etc/inetd.conf
sudo chown "$(stat -c '%U:%G' /etc/inetd.conf)" /etc/inetd.conf

# Restore original file permissions for /etc/inetd.conf
sudo chmod "$(stat -c '%a' /etc/inetd.conf)" /etc/inetd.conf

# Restore original owner and group information for /etc/xinetd.conf
sudo chown "$(stat -c '%U:%G' /etc/xinetd.conf)" /etc/xinetd.conf

# Restore original file permissions for /etc/xinetd.conf
sudo chmod "$(stat -c '%a' /etc/xinetd.conf)" /etc/xinetd.conf


# 하위 파일...

cat $result

echo ; echo