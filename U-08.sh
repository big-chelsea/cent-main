#!/bin/bash

. function.sh

BAR

CODE [U-09] /etc/hosts 파일 소유자 및 권한 설정		

cat << EOF >> $result
[양호]: /etc/hosts 파일의 소유자가 root이고, 권한이 600인 이하경우
[취약]: /etc/hosts 파일의 소유자가 root가 아니거나, 권한이 600 이상인 경우
EOF

BAR

# Get the original owner and permission of the /etc/shadow file
original_owner=$(stat -c "%U:%G" /etc/shadow)
original_permission=$(stat -c "%a" /etc/shadow)

# Restore the original owner and permission of the /etc/shadow file
sudo chown $original_owner /etc/shadow
sudo chmod $original_permission /etc/shadow

# Check if the restoration was successful
restored_owner=$(stat -c "%U:%G" /etc/shadow)
restored_permission=$(stat -c "%a" /etc/shadow)
if [ "$original_owner" == "$restored_owner" ] && [ "$original_permission" == "$restored_permission" ]; then
  OK "The original state of /etc/shadow has been successfully restored."
else
  WARN "The original state of /etc/shadow has NOT been restored."
fi




cat $result

echo ; echo