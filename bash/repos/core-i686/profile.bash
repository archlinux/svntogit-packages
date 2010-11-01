#
# /etc/profile.bash
# Global settings for bash shells
#

#In the future we may want to add more ulimit entries here,
# in the offchance that /etc/security/limits.conf is skipped
ulimit -Sc 0 #Don't create core files

# Source our global bashrc file, to remove duplication of effort
[ -r /etc/bash.bashrc ] && . /etc/bash.bashrc
