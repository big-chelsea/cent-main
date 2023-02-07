#!/bin/bash

. function.sh

BAR

CODE [U-10] /etc/(x)inetd.conf 파일 소유자 및 권한 설정		

cat << EOF >> $result

[양호]: /etc/inetd.conf 파일의 소유자가 root이고, 권한이 600인 경우

[취약]: /etc/inetd.conf 파일의 소유자가 root가 아니거나, 권한이 600이 아닌 경우

EOF

BAR

# Get original file owner and permission information
OWNER=$(stat -c '%U' /etc/inetd.conf)
GROUP=$(stat -c '%G' /etc/inetd.conf)
PERM=$(stat -c '%a' /etc/inetd.conf)

# Restore original file owner
sudo chown $OWNER:$GROUP /etc/inetd.conf

# Restore original file permissions
sudo chmod $PERM /etc/inetd.conf


cat $result

echo ; echo
