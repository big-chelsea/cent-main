#!/bin/bash

. function.sh

BAR

CODE [U-20] Anonymous FTP 비활성화

cat << EOF >> $result

[양호]: Anonymous FTP (익명 ftp) 접속을 차단한 경우

[취약]: Anonymous FTP (익명 ftp) 접속을 차단하지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  



# Restore original vsftpd configuration
sudo cp /etc/vsftpd.conf.bak /etc/vsftpd.conf

# Restart vsftpd service to apply changes
sudo service vsftpd restart

INFO "Original vsftpd configuration restored successfully."





cat $result

echo ; echo