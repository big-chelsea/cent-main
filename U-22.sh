#!/bin/bash

. function.sh

BAR

CODE [U-22] crond 파일 소유자 및 권한 설정

cat << EOF >> $result

[양호]: crontab 명령어 일반사용자 금지 및 cron 관련 파일 640 이하인 경우

[취약]: crontab 명령어 일반사용자 사용가능하거나, crond 관련 파일 640 이상인 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

>$TMP1  


# Define the directory containing cron-related files
dir="/etc/cron.d/"

# Define cron-related files
files=("cron.daily" "cron.hourly" "cron.monthly" "cron.weekly")

for file in "${files[@]}"
do
# Verify that files exist in the defined directory
if [ -f "$dir$file" ]; then
# Restore the original owner of the file
sudo chown root "$dir$file"
# Restore the original permissions to the file
sudo chmod 644 "$dir$file"
else
echo "$file not found in $dir"
fi
done

# Restore original permissions for crontab commands
sudo chmod 755 /usr/bin/crontab


#@@@@이외의 관련 설정파일도 추가적으로 권한설정 할 수 있어야 함.@@@@@
#@@@@또 crontab명령어를 일반사용자에게 허용하는 경우도 추가@@@@

cat $result

echo ; echo