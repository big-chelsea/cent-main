#!/bin/bash

. function.sh

BAR

CODE [U-28] NIS , NIS+ 점검		

cat << EOF >> $result

[양호]: NIS 서비스가 비활성화 되어 있거나, 필요 시 NIS+를 사용하는 경우

[취약]: NIS 서비스가 활성화 되어 있는 경우

EOF

BAR


# Enable ypserv service at boot time
sudo update-rc.d ypserv enable

# Start ypserv service
sudo service ypserv start

# Enable ypbind service at boot time
sudo update-rc.d ypbind enable

# Start ypbind service
sudo service ypbind start

# Enable ypxfrd service at boot time
sudo update-rc.d ypxfrd enable

# Start ypxfrd service
sudo service ypxfrd start

# Enable rpc.yppasswdd service at boot time
sudo update-rc.d rpc.yppasswdd enable

# Start rpc.yppasswdd service
sudo service rpc.yppasswdd start

# Enable rpc.ypupdated service at boot time
sudo update-rc.d rpc.ypupdated enable

# Start rpc.ypupdated service
sudo service rpc.ypupdated start

# Enable ypserv service at boot time
sudo update-rc.d ypserv enable

# Start ypserv service
sudo service ypserv start


cat $result

echo ; echo
