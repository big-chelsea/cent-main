#!/bin/bash

. function.sh

BAR

CODE [U-17] $HOME/.rhosts, hosts.equiv 사용 금지

cat << EOF >> $result
[양호]: login, shell, exec 서비스를 사용하지 않거나, 사용 시 아래와 같은 설정이 적용된 경우
       1. /etc/hosts.equiv 및 $HOME/.rhosts 파일 소유자가 root 또는, 해당 계정인 경우
       2. /etc/hosts.equiv 및 $HOME/.rhosts 파일 권한이 600 이하인 경우
       3. /etc/hosts.equiv 및 $HOME/.rhosts 파일 설정에 ‘+’ 설정이 없는 경우
[취약]: login, shell, exec 서비스를 사용하고, 위와 같은 설정이 적용되지 않은 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore the original owner of /etc/hosts.equiv
sudo chown [original_owner] /etc/hosts.equiv

# Restore the original permissions of /etc/hosts.equiv
sudo chmod [original_permissions] /etc/hosts.equiv

# Restore the original owner of $HOME/.rhosts
sudo chown [original_owner] $HOME/.rhosts

# Restore the original permissions of $HOME/.rhosts
sudo chmod [original_permissions] $HOME/.rhosts

# Check if the restore was successful
if [ -f /etc/hosts.equiv ] && [ -f $HOME/.rhosts ]; then
  OK "Successfully restored the original state of /etc/hosts.equiv and $HOME/.rhosts"
else
  WARN "Restore failed"
fi





cat $result

echo ; echo