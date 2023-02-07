#!/bin/bash

 

. function.sh


BAR

CODE [U-68] 로그온 시 경고 메시지 제공

cat << EOF >> $result

[양호]: 서버 및 Telnet 서비스에 로그온 메시지가 설정되어 있는 경우

[취약]: 서버 및 Telnet 서비스에 로그온 메시지가 설정되어 있지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1


files=("/etc/motd" "/etc/issue.net" "/etc/vsftpd/vsftpd.conf" "/etc/mail/sendmail.cf" "/etc/named.conf")
backup_dir="./backup"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# Backup original files
for file in "${files[@]}"; do
  if [ -e "$file" ]; then
    cp "$file" "$backup_dir/$(basename "$file")"
  fi
done

# Restore original files
for file in "$backup_dir/*"; do
  original_file="${file/$backup_dir\//}"
  if [ -e "$file" ]; then
    cp "$file" "$original_file"
    OK "Restored original file $original_file"
  fi
done

# Clean up backup directory
rm -rf "$backup_dir"



cat $result

echo ; echo

 
