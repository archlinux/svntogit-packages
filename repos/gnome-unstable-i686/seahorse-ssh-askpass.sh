if [ -z "$SSH_ASKPASS" ] && [ -n "$DISPLAY" ]; then
  export SSH_ASKPASS=/usr/lib/seahorse/seahorse-ssh-askpass
fi
