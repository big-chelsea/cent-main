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

# Check the owner and permissions of the /etc/passwd file
file_owner=$(ls -l /etc/passwd | awk '{print $3}')
file_permission=$(stat -c %a /etc/passwd)

if [ "$file_owner" != "root" ] || [ "$file_permission" -gt 644 ]; then
  # If the owner or permissions have changed, restore the original owner and permissions
  sudo chown $(stat -c %U:%G /etc/passwd.bak) /etc/passwd
  sudo chmod $(stat -c %a /etc/passwd.bak) /etc/passwd
  OK "The /etc/passwd file has been restored to its original state."
else
  # If the owner and permissions have not changed, print a message indicating that it has not been restored
  WARN "The /etc/passwd file has not been restored, as it is already in its original state."
fi



cat $result

echo ; echo