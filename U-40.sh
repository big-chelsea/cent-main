#!/bin/bash

. function.sh

BAR

CODE [U-40] 웹서비스 파일 업로드 및 다운로드 제한

cat << EOF >> $result

[양호]: 파일 업로드 및 다운로드를 제한한 경우

[취약]: 파일 업로드 및 다운로드를 제한하지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Backup the original Apache configuration file
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak

# Run the original script
./original_script.sh

# In case of a problem, restore the original Apache configuration file
if [ ! -z "$(cat /etc/httpd/conf/httpd.conf | grep "LimitRequestBody")" ]; then
  cp /etc/httpd/conf/httpd.conf.bak /etc/httpd/conf/httpd.conf
fi







cat $result

echo ; echo