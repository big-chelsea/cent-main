#!/bin/bash

 

. function.sh

 

BAR

CODE [U-64] ftpusers 파일 설정

cat << EOF >> $result

[양호]: FTP 서비스가 비활성화 되어 있거나, 활성 시 root 계정 접속을 차단한 경우

[취약]: FTP 서비스가 활성화 되어 있고, root 계정 접속을 허용한 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1



# File Definitions
file="/etc/ssh/sshd_config"

# Restore the original state of the file by using a backup file
cp $file.bak $file

# Restart the ssh service for changes to take effect
sudo service ssh restart



cat $result

echo ; echo 


 
