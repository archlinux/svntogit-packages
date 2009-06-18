#!/bin/bash
# Check for bash (and that we haven't already been sourced).
[ -z "$BASH_VERSION" -o -n "$BASH_COMPLETION" ] && return

# Check for interactive shell.
if shopt -q login_shell; then
    if [ -r /etc/bash_completion ]; then
        # Source completion code.
        . /etc/bash_completion
    fi
fi

