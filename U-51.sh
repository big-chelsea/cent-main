#!/bin/bash

 

. function.sh

 


TMP2=/tmp/tmp1

TMP3=/tmp/tmp2

TMP4=/tmp/tmp3

 

BAR

CODE [U-51] 계정이 존재하지 않는 GID 금지

cat << EOF >> $result

양호: 존재하지 않는 계정에 GID 설정을 금지한 경우

취약: 존재하지 않은 계정에 GID 설정이 되어있는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Prompt for group name
read -p "Enter group name: " group_name

# Check if group exists
if ! grep -q $group_name /etc/group; then
  WARN "user 존재하지 않음"
else
  OK "user 존재함"
  # Backup group information
  grep $group_name /etc/group > $TMP2
  # Delete group
  groupdel $group_name
fi

# Restore group in case of a problem
if [ ! -f $TMP2 ]; then
  groupadd $(cat $TMP2 | awk -F: '{print $1}')
  echo "The group has been restored."
fi

cat $result
echo ; echo



 

cat $result

echo ; echo
