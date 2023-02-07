#!/bin/bash

 

. function.sh

 

BAR

CODE [U-71] Apache 웹서비스 정보 숨김

cat << EOF >> $result

[양호]: ServerTokens Prod, ServerSignature Off로 설정되어있는 경우

[취약]: ServerTokens Prod, ServerSignature Off로 설정되어있지 않은 경우

EOF

BAR


TMP1=`SCRIPTNAME`.log

> $TMP1 



# Restore the original Server Tokens directive
sed -i '/^ServerTokens/d' /etc/httpd/conf/httpd.conf

# Restore the original Server Signature directive
sed -i '/^ServerSignature/d' /etc/httpd/conf/httpd.conf

# Restart Apache service to apply changes
service httpd restart




cat $result

echo ; echo 