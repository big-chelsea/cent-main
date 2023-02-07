#!/bin/bash

 

. function.sh

 

BAR

CODE [U-57] 홈 디렉터리 소유자 및 권한

cat << EOF >> $result

[양호]: 홈 디렉터리 소유자가 해당 계정이고, 일반 사용자 쓰기 권한이 제거된 경우

[취약]: 홈 디렉터리 소유자가 해당 계정이 아니고, 일반 사용자 쓰기 권한이 부여된 경우 

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1  

# 홈 디렉터리의 원래 소유권 및 사용 권한 백업
for user in $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) print $1}' /etc/passwd); do
  if [ -d /home/$user ]; then
    sudo cp -Rp /home/$user /home/$user.bak
  fi
done

# 홈 디렉터리의 원래 소유권 및 사용 권한 복원
for user in $(awk -F: '{ if ($3 >= 1000 && $3 <= 60000) print $1}' /etc/passwd); do
  if [ -d /home/$user ]; then
    sudo rm -rf /home/$user
    sudo cp -Rp /home/$user.bak /home/$user
    sudo rm -rf /home/$user.bak
  fi
done






cat $result

echo ; echo 


 
