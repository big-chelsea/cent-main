#!/bin/bash

 

. function.sh
 

BAR

CODE [U-63] ftpusers 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: ftpusers 파일의 소유자가 root이고, 권한이 640 이하인 경우

[취약]: ftpusers 파일의 소유자가 root아니거나, 권한이 640 이하가 아닌 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1


# Get the original owner and permissions of the file "/etc/vsftpd/ftpusers"
ORIGINAL_OWNER=$(stat -c %U /etc/vsftpd/ftpusers)
ORIGINAL_GROUP=$(stat -c %G /etc/vsftpd/ftpusers)
ORIGINAL_PERMISSIONS=$(stat -c %a /etc/vsftpd/ftpusers)

# Restore the original owner of the file "/etc/vsftpd/ftpusers"
sudo chown $ORIGINAL_OWNER:$ORIGINAL_GROUP /etc/vsftpd/ftpusers

# Restore the original permissions of the file "/etc/vsftpd/ftpusers"
sudo chmod $ORIGINAL_PERMISSIONS /etc/vsftpd/ftpusers


cat $result

echo ; echo 

 
