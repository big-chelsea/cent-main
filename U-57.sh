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

# Read /etc/passwd file and extract home directory
output=$(cat /etc/passwd | awk -F ':' '{print $6}')

# Split the output into arrays
arr=($output)

# Backup original state of home directories
for line in "${arr[@]}"
do
sudo cp -Rp $line $line.bak
done

# Repeat the array to restore original state of home directories
for line in "${arr[@]}"
do
if [ -d "$line.bak" ]; then
sudo rm -rf $line
sudo cp -Rp $line.bak $line
OK "Original state of $line has been successfully restored."
else
WARN "The original state of $line could not be restored."
fi
done

cat $result

echo ; echo