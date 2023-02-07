#!/bin/bash

 

. function.sh

 

TMP2=$(mktemp)

TMP3=$(mktemp)

> $TMP2

> $TMP3

 

BAR

CODE [U-52] 동일한 UID 금지

cat << EOF >> $result

양호: 동일한 UID로 설정된 사용자 계정이 존재하지 않는 경우

취약: 동일한 UID로 설정된 사용자 계정이 존재하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1

# Prompt for username
read -p "Enter username: " username

# Check if the user has been modified
if grep -q $username /etc/passwd; then
  # Get the original UID
  original_uid=$(grep $username /etc/passwd | cut -d: -f3)

  # Restore the original UID
  usermod -u $original_uid $username

  OK "User's UID has been restored to its original state"
else
  ERR "User not found"
fi



 

cat $result

echo ; echo
