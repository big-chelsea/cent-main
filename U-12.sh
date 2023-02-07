#!/bin/bash

. function.sh

BAR

CODE [U-12] /etc/services 파일 소유자 및 권한 설정		

cat << EOF >> $result

[양호]: etc/services 파일의 소유자가 root(또는 bin, sys)이고, 권한이 644 이하
인 경우

[취약]: etc/services 파일의 소유자가 root(또는 bin, sys)이고, 권한이 644 이하
인 경우

EOF

BAR

# Get original owner and permissions of the /etc/services file
original_owner=$(stat -c '%U:%G' /etc/services)
original_permissions=$(stat -c '%a' /etc/services)

# Restore the original owner and permissions
sudo chown "$original_owner" /etc/services
sudo chmod "$original_permissions" /etc/services


cat $result

echo ; echo
