#!/bin/bash

 

. function.sh


 

BAR

CODE [U-49] 불필요한 계정 제거

cat << EOF >> $result

[양호]: 불필요한 계정이 존재하지 않는 경우

[취약]: 불필요한 계정이 존재하는 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1

# Prompt for username
read -p "Enter username: " username

# Check if user already exists
if grep -q $username /etc/passwd; then
  echo "User already exists. Exiting."
  exit 1
fi

# Restore user account
useradd $username
echo "User account restored."

 
cat $result

echo ; echo
