#!/bin/bash

. function.sh

BAR

CODE [U-07] /etc/passwd 파일 소유자 및 권한 설정	

cat << EOF >> $result

[양호]: /etc/passwd 파일의 소유자가 root이고, 권한이 644 이하인 경우

[취약]: /etc/passwd 파일의 소유자가 root가 아니거나, 권한이 644 이하가 아닌
경우

EOF

BAR

# Change file owner and group to the original owner and group
sudo chown "$(stat -c '%U:%G' /etc/passwd)" /etc/passwd

# Set permissions to the original permissions
sudo chmod "$(stat -c '%a' /etc/passwd)" /etc/passwd

cat $result

echo ; echo