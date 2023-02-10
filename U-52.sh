#!/bin/bash

. function.sh

BAR

CODE [U-52] 동일한 UID 금지

cat << EOF >> $result
양호: 동일한 UID로 설정된 사용자 계정이 존재하지 않는 경우
취약: 동일한 UID로 설정된 사용자 계정이 존재하는 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Check if TMP1 exists
if [ ! -f $TMP1 ]; then
  INFO "The original state has not been recovered as the log file does not exist."
fi

# Read the TMP1 file line by line
while read line; do
  # Split line by space
  arr=($line)

  # Get the user and the original UID
  user=${arr[0]}
  orig_uid=${arr[2]}

  # Check if the user still exists
  if id "$user" > /dev/null 2>&1; then
    # Change the user's UID back to the original value
    sudo usermod -u $orig_uid $user

    # Print results
    INFO "UID of $user restored back to $orig_uid"
  fi
done < $TMP1

# Remove TMP1
sudo rm $TMP1


cat $result

echo ; echo