#!/bin/bash

 

. function.sh

 

BAR

CODE [U-62] ftp 계정 shell 제한

cat << EOF >> $result

[양호]: ftp 계정에 /bin/false 쉘이 부여되어 있는 경우

[취약]: ftp 계정에 /bin/false 쉘이 부여되지 않 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1


# Account Name Definition
account_name="ftp"

# Find a line in the /etc/passwd file that corresponds to the ftp account
line=$(grep "^$account_name:" /etc/passwd)

# Message and exit if the account is not found
if [ -z "$line" ]; then
  echo "There is no account $account_name in the /etc/passwd file."
  exit 1
fi

# Extract the original shell
original_shell=$(grep "^$account_name:" /etc/passwd_original | cut -d: -f7)

# Make sure the current shell is set to /bin/false
if [ "$current_shell" == "/bin/false" ]; then
  # Change the current shell to the original shell
  new_line=$(echo "$line" | sed "s#/bin/false#$original_shell#")

  # Update /etc/passwd file
  sudo sed -i "s#$line#$new_line#" /etc/passwd
else
  echo "The ftp account shell is already set to the original value."
fi




cat $result

echo ; echo 

 
