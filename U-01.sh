#!/bin/bash

. function.sh

BAR

CODE [U-01] root 계정 원격 접속 제한

cat << EOF >> $result

[양호]: 원격 서비스를 사용하지 않거나 사용시 직접 접속을 차단한 경우

[취약]: root 직접 접속을 허용하고 원격 서비스를 사용하는 경우

EOF

BAR


# Restore /etc/pam.d/login to its original state
sudo mv /etc/pam.d/login.bak /etc/pam.d/login

# Restore /etc/securety to its original state
sudo mv /etc/securety.bak /etc/securety

if [ -f "/etc/pam.d/login.bak" ]; then
  sudo mv /etc/pam.d/login.bak /etc/pam.d/login
  if [ $? -eq 0 ]; then
    echo "/etc/pam.d/login을 원래 상태로 복원했습니다."
  else
    echo "/etc/pam.d/login을 원래 상태로 복원하지 못했습니다."
  fi
else
  echo "/etc/sla.d/sla.d/sla.bak을 찾을 수 없습니다. 원래 상태가 복구되지 않았습니다."
fi

if [ -f "/etc/security.bak" ]; then
  sudo mv /etc/security.bak /etc/security
  if [ $? -eq 0 ]; then
    echo "/etc/security를 원래 상태로 복원했습니다."
  else
    echo "/etc/security를 원래 상태로 복원하지 못했습니다."
  fi
else
  echo "/etc/security.bak을 찾을 수 없습니다. 원래 상태가 복구되지 않았습니다."
fi


cat $result

echo ; echo