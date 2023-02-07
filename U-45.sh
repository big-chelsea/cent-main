#!/bin/bash

. function.sh

BAR

CODE [U-45] root 계정 su 제한		

cat << EOF >> $result

[양호]: su 명령어를 특정 그룹에 속한 사용자만 사용하도록 제한되어 있는 경우
※ 일반사용자 계정 없이 root 계정만 사용하는 경우 su 명령어 사용제한 불필요

[취약]: su 명령어를 모든 사용자가 사용하도록 설정되어 있는 경우

EOF

BAR



# Remove wheel group from the list of users
for user in "${user_list[@]}"; do
  usermod -G "" "$user"
  OK "Removed user $user from the wheel group."
done

# Reset permission to 4755 in su command
chmod 4755 /bin/su

# Validate Permissions
if [ $(stat -c %a /bin/su) == "4755" ]; then
  Permission for OK "/bin/su is set to 4755."
else
  Failed to set permissions for WARN "/bin/su."
fi



cat $result

echo ; echo

