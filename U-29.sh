#!/bin/bash

. function.sh

BAR

CODE [U-29] tftp, talk 서비스 비활성화		

cat << EOF >> $result

[양호]: tftp, talk, ntalk 서비스가 비활성화 되어 있는 경우

[취약]: tftp, talk, ntalk 서비스가 활성화 되어 있는 경우

EOF

BAR

# Remove the created xinetd configuration files for tftp, talk, and ntalk services
rm -f /etc/xinetd.d/tftp
rm -f /etc/xinetd.d/talk
rm -f /etc/xinetd.d/ntalk

# Restart the xinetd service to reflect the changes
systemctl restart xinetd


cat $result

echo ; echo
