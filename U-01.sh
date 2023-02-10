#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR




if [ -f "/etc/pam.d/login.bak" ]; then
  sudo cp /etc/pam.d/login.bak /etc/pam.d/login
  if [ $? -eq 0 ]; then
    echo "Successfully restored /etc/pam.d/login to its original state."
  else
    echo "Failed to restore /etc/pam.d/login to its original state."
  fi
else
  echo "/etc/pam.d/login.bak not found, original state has not been recovered."
fi

if [ -f "/etc/security.bak" ]; then
  sudo cp /etc/security.bak /etc/security
  if [ $? -eq 0 ]; then
    echo "Successfully restored /etc/security to its original state."
  else
    echo "Failed to restore /etc/security to its original state."
  fi
else
  echo "/etc/security.bak not found, original state has not been recovered."
fi



cat $result

echo ; echo