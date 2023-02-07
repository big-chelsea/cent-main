#!/bin/bash

. function.sh

BAR

CODE [U-37] 웹서비스 상위 디렉토리 접근 금지

cat << EOF >> $result

[양호]: 상위 디렉터리에 이동제한을 설정한 경우

[취약]: 상위 디렉터리에 이동제한을 설정하지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


file="/etc/httpd/conf/httpd.conf"

# Backup the original file
cp $file "$file.bak"

if [ -f "$file" ]; then
  # Replace "AllowOverride None" with "AllowOverride AuthConfig"
  sed -i 's/AllowOverride None/AllowOverride AuthConfig/g' $file

  # Check for changes
  if grep -q "AllowOverride AuthConfig" $file; then
    echo "AllowOverrideNone was successfully replaced with AllowOverrideAuthConfig."
  else
    echo "Replacing AllowOverrideNone with AllowOverrideAuthConfig failed."
  fi
fi

# Restart the httpd daemon to apply configuration changes
sudo service httpd restart

# Restore the original file if there is a problem
if [ ! -f "$file.bak" ]; then
  echo "Error: Backup file not found."
  exit 1
fi

echo "Do you want to restore the original file? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
  mv "$file.bak" $file
  echo "Original file was successfully restored."
else
  echo "Original file was not restored."
fi


cat $result

echo ; echo