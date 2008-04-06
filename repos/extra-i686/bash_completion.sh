#!/bin/bash
#
# /etc/profile.d/bash-completion
#
# check if we use bash
if [ $SHELL = "/bin/bash" ]; then
	bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
	if [ -n "$PS1" ] && [ \( $bmajor -eq 2 -a $bminor '>' 04 \) -o $bmajor -ge 3 ] \
	  && [ -f /etc/bash_completion ]; then # interactive shell
	  # Source completion code
	  . /etc/bash_completion
	fi
	unset bash bmajor bminor
fi
