#!/bin/sh

usr_id=1035
usr_name=nodered
usr_home=/var/db/nodered

install -d -g ${usr_id} -o ${usr_id} -m 775 -- ${usr_home}
pw useradd -u ${usr_id} -n ${usr_name} -d ${usr_home} -s /usr/local/bin/bash -w no

/usr/local/bin/npm install -g --unsafe-perm node-red

sysrc -f /etc/rc.conf nodered_enable="YES"
service nodered start 2>/dev/null
