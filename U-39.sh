#!/bin/bash

. function.sh

BAR

CODE [U-39] 웹서비스 링크 사용금지

cat << EOF >> $result

[양호]: 심볼릭 링크, aliases 사용을 제한한 경우

[취약]: 심볼릭 링크, aliases 사용을 제한하지 않은 경우 

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Defining Apache Configuration Files
file="/etc/httpd/conf/httpd.conf"

# Check if the file exists
if [ -f "$file" ]; then
  echo "Found Apache configuration file."
else
  echo "Apache configuration file not found."
  exit 1
fi

# Backup the file
cp $file $file.bak

# Replace "Options Follow Symplinks" with "Options"
sed -i 's/Options FollowSymLinks/Options/g' $file

# Check for changes
if grep -q "Options" $file; then
  echo "Options FollowSymLinks was replaced with Options."
else
  echo "Options FollowSymLinks was not replaced with Options."
fi

# Restore the file if there is a problem
echo "Do you want to restore the original Apache configuration file? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
  mv $file.bak $file
  echo "Apache configuration file was successfully restored."
else
  echo "Apache configuration file was not restored."
fi




cat $result

echo ; echo