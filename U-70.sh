#!/bin/bash

 

. function.sh

 

BAR

CODE [U-70] expn, vrfy 명령어 제한

cat << EOF >> $result
[양호]: SMTP 서비스 미사용 또는, noexpn, novrfy 옵션이 설정되어 있는 경우
[취약]: SMTP 서비스 사용하고, noexpn, novrfy 옵션이 설정되어 있지 않는 경우
EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Check if sendmail init script is backed up
if [ -e "/etc/rc2.d/S88sendmail_bak" ]; then
  # Move sendmail init script back to /etc/rc2.d
  mv /etc/rc2.d/S88sendmail_bak /etc/rc2.d/S88sendmail

  # Start the outgoing mail process
  /etc/rc2.d/S88sendmail start

  INFO "The original state of the SMTP service was recovered."
else
  WARN "The original state of the SMTP service was not found. Restoration failed."
fi

cat $result

echo ; echo