#!/bin/bash

. function.sh

BAR

CODE [U-06] 파일 및 디렉터리 소유자 설정

cat << EOF >> $result

[양호]: 소유자가 존재하지 않는 파일 및 디렉터리가 존재하지 않는 경우

[취약]: 소유자가 존재하지 않는 파일 및 디렉터리가 존재하는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  

# Restore files owned by "nouser"
for file in $(find "$backup_dir" -name "*nouser*"); do
original_file=${file//"$backup_dir"/""}
mkdir -p $(dirname "$original_file")
cp -R "$file" "$original_file"
done

# Restore files owned by "nogroup"
for file in $(find "$backup_dir" -name "*nogroup*"); do
original_file=${file//"$backup_dir"/""}
mkdir -p $(dirname "$original_file")
cp -R "$file" "$original_file"
done

echo "Files owned by 'nouser' and 'nogroup' have been restored to their original locations."


cat $result

echo ; echo