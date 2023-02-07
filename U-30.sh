#!/bin/bash

 

. function.sh

 
TMP1=`SCRIPTNAME`.log

> $TMP1
 
 

BAR

CODE [U-30] Sendmail 버전 점검

cat << EOF >> $result

[양호]: Sendmail 버전이 최신버전인 경우 

[취약]: Sendmail 버전이 최신버전이 아닌 경우

EOF

BAR

# Function to restore original state
restore_state() {
  # Check if the sendmail version has changed
  original_version=`echo \$Z | /usr/lib/sendmail -bt -d0 | sed -n '1p' | awk '{print $2}'`

  if [ "$original_version" != "$SV" ]; then
    # Uninstall the latest version of sendmail
    yum remove sendmail

    # Install the original version of sendmail
    yum install sendmail-$original_version

    # Start the sendmail daemon
    service sendmail start
  fi
}

# Run the original script
./script.sh

# Check if there's an error
if [ $? -ne 0 ]; then
  echo "An error occurred while running the script."
  echo "Restoring the original state..."
  restore_state
fi






cat $result

echo ; echo
 
