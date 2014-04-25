#!/bin/bash
if /usr/sbin/pidof httpd; then 
	notify-send Xampp -i dialog-information "gia in esecuzione."
  exit 2
fi
# start xampp
ret=$(beesu - -c "/opt/lampp/lampp start");
if [ -z "$ret" ]; then
  notify-send Xamp -i dialog-warning "User Abort"
else
  notify-send Xampp -i dialog-information "$ret"
fi
exit 0
