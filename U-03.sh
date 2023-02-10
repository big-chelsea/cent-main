#!/bin/bash

. function.sh

BAR

CODE [U-03] 패스워드 파일 보호

cat << EOF >> $result

[양호]: 계정 잠금 임계값이 10회 이하의 값으로 설정되어 있는 경우

[취약]: 계정 잠금 임계값이 설정되어 있지 않거나, 10회 이하의 값으로 설정되지 않은 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore the original state
if cp /etc/pam.d/common-auth.bak /etc/pam.d/common-auth; then
    OK "The original state has been restored."
else
    WARN "The original state could not be restored."
fi



cat $result

echo ; echo