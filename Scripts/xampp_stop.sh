#!/bin/bash
if ! /usr/sbin/pidof httpd; then
	notify-send -i dialog-error "Xampp is not running. Impossibile fermarlo."
  exit 2
fi

# Stop xampp
# Fedora version with beesu. Uncomment this to use beesu version
#ret=$(beesu - -c "/opt/lampp/lampp stop");
#if [ -z "$ret" ]; then
#  notify-send Xampp -i dialog-warning "User Abort"
#else
#  notify-send Xampp -i dialog-information "$ret"
#fi

#Fedora version with pkexec
outp=$(pkexec /opt/lampp/lampp stop);
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
