#!/bin/bash

. function.sh

BAR

CODE [U-59] 숨겨진 파일 및 디렉터리 검색 및 제거

cat << EOF >> $result
[양호]: 디렉터리 내 숨겨진 파일을 확인하여, 불필요한 파일 삭제를 완료한 경우
[취약]: 디렉터리 내 숨겨진 파일을 확인하지 않고, 불필요한 파일을 방치한 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1 

# Define the list of deleted files and directories
deleted_files=$(sudo find / -type f -name ".*" ! -path "/run/user/1000/gvfs/*" -mtime -1)
deleted_dirs=$(sudo find / -type d -name ".*" ! -path "/run/user/1000/gvfs/*" -mtime -1)

# Restore the deleted files and directories
for file in $deleted_files; do
sudo cp -p $file /tmp/$(basename $file)
done

for dir in $deleted_dirs; do
sudo cp -rp $dir /tmp/$(basename $dir)
done

# Check if the restoration was successful
for file in $deleted_files; do
if [ ! -f $file ]; then
OK "The file $file has not been restored."
fi
done

for dir in $deleted_dirs; do
if [ ! -d $dir ]; then
WARN "The directory $dir has not been restored."
fi
done

cat $result

echo ; echo