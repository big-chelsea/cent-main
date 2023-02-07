#!/bin/bash

. function.sh

BAR

CODE [U-21] r 계열 서비스 비활성화		

cat << EOF >> $result

[양호]: 불필요한 r 계열 서비스가 비활성화 되어 있는 경우

[취약]: 불필요한 r 계열 서비스가 활성화 되어 있는 경우

EOF

BAR

# Restore the original rlogin file
if [ -f /etc/xinetd.d/rlogin.bak ]; then
  mv /etc/xinetd.d/rlogin.bak /etc/xinetd.d/rlogin
else
  rm /etc/xinetd.d/rlogin
fi

# Restore the original rsh file
if [ -f /etc/xinetd.d/rsh.bak ]; then
  mv /etc/xinetd.d/rsh.bak /etc/xinetd.d/rsh
else
  rm /etc/xinetd.d/rsh
fi

# Restore the original rexec file
if [ -f /etc/xinetd.d/rexec.bak ]; then
  mv /etc/xinetd.d/rexec.bak /etc/xinetd.d/rexec
else
  rm /etc/xinetd.d/rexec
fi


cat $result

echo ; echo
