#!/bin/bash

. function.sh

BAR

CODE [U-32] 일반사용자의 Sendmail 실행 방지		

cat << EOF >> $result

[양호]: SMTP 서비스 미사용 또는, 일반 사용자의 Sendmail 실행 방지가 설정된
경우

[취약]: SMTP 서비스 사용 및 일반 사용자의 Sendmail 실행 방지가 설정되어 
있지 않은 경우

EOF

BAR



# Start the Sendmail service
sendmail &

# Confirm Sendmail is running
PID=$(ps -ef | grep sendmail | awk '{print $2}')
if [ -z "$PID" ]; then
  echo "Sendmail service could not be started."
else
  echo "Sendmail service has been started with PID: $PID"
fi



cat $result

echo ; echo

