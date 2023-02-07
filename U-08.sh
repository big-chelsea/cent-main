#!/bin/bash

. function.sh

BAR

CODE [U-09] /etc/hosts 파일 소유자 및 권한 설정		

cat << EOF >> $result

[양호]: /etc/hosts 파일의 소유자가 root이고, 권한이 600인 이하경우

[취약]: /etc/hosts 파일의 소유자가 root가 아니거나, 권한이 600 이상인 경우

EOF

BAR


# Get original owner and permission of the /etc/shadow file
original_owner=$(stat -c "%U:%G" /etc/shadow)
original_permission=$(stat -c "%a" /etc/shadow)

# Change file owner and permission to their original state
sudo chown $original_owner /etc/shadow
sudo chmod $original_permission /etc/shadow


cat $result

echo ; echo
