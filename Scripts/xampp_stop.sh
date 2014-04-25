#!/bin/bash
if ! /usr/sbin/pidof httpd; then
	notify-send -i dialog-error "Xampp is not running. Impossibile fermarlo."
  exit 2
fi
# Stop xampp
ret=$(beesu - -c "/opt/lampp/lampp stop");
if [ -z "$ret" ]; then
  notify-send Xampp -i dialog-warning "User Abort"
else
  notify-send Xampp -i dialog-information "$ret"
fi
exit 0
