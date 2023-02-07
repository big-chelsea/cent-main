#!/bin/bash

 

. function.sh

 

 

BAR

CODE [U-54] Session Timeout 설정

cat << EOF >> $result

[양호]: Session Timeout이 600초(10분) 이하로 설정되어 있는 경우

[취약]: Session Timeout이 600초(10분) 이하로 설정되지 않은 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1

# Check if the TMOUT variable is set in /etc/profile
if grep -q "TMOUT" /etc/profile; then
  # Store the original content of /etc/profile
  ORIGINAL_PROFILE=$(cat /etc/profile)

  # Remove the lines with TMOUT from /etc/profile
  sed -i '/TMOUT/d' /etc/profile

  # Store the current content of /etc/profile
  CURRENT_PROFILE=$(cat /etc/profile)

  # Check if the original and current content of /etc/profile are different
  if [ "$ORIGINAL_PROFILE" != "$CURRENT_PROFILE" ]; then
    # Restore the original content of /etc/profile
    echo "$ORIGINAL_PROFILE" > /etc/profile
  fi
fi




cat $result

echo ; echo
