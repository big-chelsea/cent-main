#!/bin/bash

. function.sh

BAR

CODE [U-02] 패스워드 복잡성 설정

cat << EOF >> $result

[양호]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

[취약]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore login.defs files
cp /etc/login.defs.bak /etc/login.defs

# Restore source files
cp /etc/pam.d/system-auth.bak /etc/pam.d/system-auth

# Remove backup file
rm /etc/pam.d/system-auth.bak

# Remove backup file
rm /etc/login.defs.bak

cat $result

echo ; echo