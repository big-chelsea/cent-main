#!/bin/bash

. function.sh

BAR

CODE [U-53] 사용자 shell 점검

cat << EOF >> $result
[양호]: Session Timeout이 600초(10분) 이하로 설정되어 있는 경우
[취약]: Session Timeout이 600초(10분) 이하로 설정되지 않은 경우
EOF

TMP2=/tmp/tmp1

> $TMP2

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Get a list of users with modified shells
user_list=$(grep "/bin/false" /etc/passwd | awk -F: '{print $1}')

# Loop through the list of users
for user in $user_list; do
# Get the original shell of the user
orig_shell=$(grep "^$user:" /etc/passwd.bak | awk -F: '{print $7}')

# Restore the original shell of the user
sudo usermod -s $orig_shell $user

# Verify that the shell has been restored
shell=$(grep "^$user:" /etc/passwd | awk -F: '{print $7}')
if [ $shell == $orig_shell ]; then
OK "User $user original shell ($orig_shell) has been restored."
else
ERROR "Failed to restore user $user original shell ($orig_shell)."
fi
done


cat $result

echo ; echo