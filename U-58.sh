#!/bin/bash

. function.sh

BAR

CODE [U-58] 홈 디렉터리로 지정한 디렉터리의 존재 관리 

cat << EOF >> $result
[양호]: 홈 디렉터리가 존재하지 않는 계정이 발견되지 않는 경우
[취약]: 홈 디렉터리가 존재하지 않는 계정이 발견된 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 

# Restore the original state of user accounts
for user in $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) print $1}' /etc/passwd); do
if [ ! -d /home/$user ]; then
usermod -d /tmp/$user $user
fi
done

# Check if the restoration was successful
for user in $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) print $1}' /etc/passwd); do
if [ ! -d /home/$user ]; then
OK "The home directory for user $user has not been restored."
fi
done

cat $result

echo ; echo