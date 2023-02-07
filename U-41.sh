#!/bin/bash

. function.sh

BAR

CODE [U-41] 웹서비스 영역의 분리

cat << EOF >> $result

[양호]: DocumentRoot를 별도의 디렉터리로 지정한 경우

[취약]: DocumentRoot를 기본 디렉터리로 지정한 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Backup the original Apache configuration file
cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.bak

# Run the original script
./original_script.sh

# In case of a problem, restore the original Apache configuration file
if [ ! -z "$(cat /etc/httpd/conf/httpd.conf | grep "DocumentRoot /home/centos/newphp/")" ]; then
  cp /etc/httpd/conf/httpd.conf.bak /etc/httpd/conf/httpd.conf
fi








cat $result

echo ; echo