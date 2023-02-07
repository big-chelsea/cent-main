#!/bin/bash

 

. function.sh

TMP2=$(mktemp)

 

BAR

CODE [U-50] 관리자 그룹에 최소한의 계정 포함

cat << EOF >> $result

양호: 관리자 그룹에 불필요한 계정이 등록되어 있지 않은 경우

취약: 관리자 그룹에 불필요한 계정이 등록되어 있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Prompt for username
read -p "Enter username: " username

# Check if user is already a member of the "manager" group
if groups $username | grep -q 'manager'; then
  echo "User is already a member of the 'manager' group. Exiting."
  exit 1
fi

# Add user to the "manager" group
gpasswd -a $username manager
echo "User added to the 'manager' group."

 

 

cat $result

echo ; echo
