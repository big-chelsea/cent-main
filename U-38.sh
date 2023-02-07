#!/bin/bash

. function.sh

BAR

CODE [U-38] 웹서비스 불필요한 파일 제거

cat << EOF >> $result

[양호]: 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되어 있는 경우

[취약]: 기본으로 생성되는 불필요한 파일 및 디렉터리가 제거되지 않은 경우 

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Check for unnecessary files and directories
echo "Checking Apache home directory for unwanted files and directories..."
if [ -d "/etc/httpd/conf/httpd.conf/manual" ]; then
  echo "Found manual directory."
else
  echo "Manual directory not found."
fi

# Backup the manual directory
cp -r /etc/httpd/conf/httpd.conf/manual /etc/httpd/conf/httpd.conf/manual.bak

# Remove manual directories and files
echo "Removing manual directory and files..."
sudo rm -rf /etc/httpd/conf/httpd.conf/manual

# Verify that files and directories have been removed
echo "Checking if manual directories and files have been removed..."
if [ -d "/etc/httpd/conf/httpd.conf/manual" ]; then
  echo "Manual directory and files still exist."
else
  echo "Manual directory and files have been removed."
fi

# Restore the manual directory if there is a problem
echo "Do you want to restore the manual directory? (yes/no)"
read answer

if [ "$answer" == "yes" ]; then
  mv /etc/httpd/conf/httpd.conf/manual.bak /etc/httpd/conf/httpd.conf/manual
  echo "Manual directory was successfully restored."
else
  echo "Manual directory was not restored."
fi




cat $result

echo ; echo