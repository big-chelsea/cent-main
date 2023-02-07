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



# Defining the list of deleted hidden files and directories
deleted_hidden_files=$(sudo grep "Found unwanted file:" $TMP1 | awk '{print $5}')
deleted_hidden_dirs=$(sudo grep "Found suspicious directory:" $TMP1 | awk '{print $5}')

# Restore the deleted hidden files
for file in $deleted_hidden_files; do
sudo touch $file
done

# Restore the deleted hidden directories
for dir in $deleted_hidden_dirs; do
sudo mkdir $dir
done



cat $result

echo ; echo 

 
