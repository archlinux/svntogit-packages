#!/bin/sh

post_upgrade() {
  if [ "$(vercmp 0.9.0 "$2")" -eq 1 ]; then
    printf '==> If your /usr is on a separate partition, you must add the "usr" hook\n'
    printf '    to /etc/mkinitcpio.conf and regenerate your images before rebooting\n'
  fi
}
