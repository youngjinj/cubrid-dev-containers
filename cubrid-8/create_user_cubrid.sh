#!/bin/bash

while true; do
        if [ `cat /etc/passwd | grep "^cubrid:" | wc -l` != 0 ]; then
                break;
        fi

        if [ `whoami` != "root" ]; then
                break;
        fi

        IP_D_CLASS=`hostname -I | awk -F '.' '{printf("%3s", $NF)}'`
        sed --in-place "s/UID_MIN                  1000/UID_MIN              ${IP_D_CLASS//[[:space:]]/}01000/" /etc/login.defs
        sed --in-place "s/UID_MAX                 60000/UID_MAX              ${IP_D_CLASS//[[:space:]]/}60000/" /etc/login.defs
        sed --in-place "s/GID_MIN                  1000/GID_MIN              ${IP_D_CLASS//[[:space:]]/}01000/" /etc/login.defs
        sed --in-place "s/GID_MAX                 60000/GID_MAX              ${IP_D_CLASS//[[:space:]]/}60000/" /etc/login.defs

        useradd cubrid

	# When volume is reused
	#  -  useradd: warning: the home directory already exists.
	#   - Not copying any file from skel directory into it.
	cp -rT /etc/skel /home/cubrid
	chown -R cubrid:cubrid /home/cubrid

        echo "cubrid:password" | chpasswd
        usermod -aG wheel cubrid

        break;
done
