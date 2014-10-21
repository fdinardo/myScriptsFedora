#!/bin/bash
if /usr/sbin/pidof httpd; then 
	notify-send Xampp -i dialog-information "gia in esecuzione."
  exit 2
fi
# start xampp

# Fedora use beesu tu run script as superuser
# ret=$(beesu - -c "/opt/lampp/lampp start");

#if [ -z "$ret" ]; then
#  notify-send Xamp -i dialog-warning "User Abort"
#else
#  notify-send Xampp -i dialog-information "$ret"
#fi

# Now i'm tring to switch to pkexec that shows a polkit dialog
outp=$(pkexec /opt/lampp/lampp start);
error_num=$?
if (( $error_num != 0 )) ; then
  dialog="dialog-warning";
  if (( $error_num == 126 )) ; then
    outp="Operazione annullata dall'utente."
  fi
else
  dialog="dialog-information";
fi

notify-send Xampp -i $dialog "$outp"
exit 0
