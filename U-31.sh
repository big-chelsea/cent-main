#!/bin/bash

. function.sh

BAR

CODE [U-31] 스팸 메일 릴레이 제한		

cat << EOF >> $result

[양호]: SMTP 서비스를 사용하지 않거나 릴레이 제한이 설정되어 있는 경우

[취약]: SMTP 서비스를 사용하며 릴레이 제한이 설정되어 있지 않은 경우

EOF

BAR





# Specify file path
file="/etc/mail/access"

# Remove the line that sets relay restrictions
sed -i '/R.*550 Relaying denied/d' $file

# Remove annotations from lines
sed -i '/^[A-Z].*#/ s/#//' $file

# Remove the access.db file
rm /etc/mail/access.db

INFO "Original state restored"


cat $result

echo ; echo
