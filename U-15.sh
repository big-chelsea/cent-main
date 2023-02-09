#!/bin/bash

. function.sh

BAR

CODE [U-15] world writable 파일 점검

cat << EOF >> $result
[양호]: 시스템 중요 파일에 world writable 파일이 존재하지 않거나, 존재 시 설정 이유를 확인하고 있는 경우
[취약]: 시스템 중요 파일에 world writable 파일이 존재하나 해당 설정 이유를 확인하고 있지 않는 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


if [ -f $TMP1 ]; then
  while read line; do
    # Restore the original permissions of the file
    sudo chmod $line /path/to/file
  done < $TMP1
fi




cat $result

echo ; echo