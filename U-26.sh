#!/bin/bash

. function.sh

BAR

CODE [U-26] automountd 제거		

cat << EOF >> $result

[양호]: automountd 서비스가 비활성화 되어 있는 경우

[취약]: automountd 서비스가 활성화 되어 있는 경우

EOF

BAR

# Start the automountd service
sudo service autofs start

# Set the automountd service to start automatically at boot time
sudo chkconfig autofs on

# Check the status of the automountd service
sudo service autofs status

cat $result

echo ; echo
