#!/bin/bash

 

. function.sh


TMP2=/tmp/tmp1

> $TMP2

 

BAR

CODE [U-53] 사용자 shell 점검

cat << EOF >> $result

[취약]: 로그인이 필요하지 않은 계정에 /bin/false(nologin) 쉘이 부여되어 있는 경우

[양호]: 로그인이 필요하지 않은 계정에 /bin/false(nologin) 쉘이 부여되지 않은 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1

# Prompt for username
read -p "Enter username: " username

# Check if user exists
if ! grep -q $username /etc/passwd; then
  WARN "user does not exist"
else
  OK "user exists"
  # Get the original shell for the user
  original_shell=$(grep $username /etc/passwd | cut -d: -f7)
  # Change user's shell back to the original shell
  usermod -s $original_shell $username
  OK "Original shell for the user restored"
fi

cat $result

echo ; echo



 

cat $result

echo ; echo
