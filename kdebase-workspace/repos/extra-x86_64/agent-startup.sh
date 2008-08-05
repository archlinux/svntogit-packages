# Agents startup file
#
# This file is sourced at kde startup, so that
# the environment variables set here are available
# throughout the session.

# Uncomment the following lines to start gpg-agent
# and/or ssh-agent at kde startup.
# If you do so, do not forget to uncomment the respective
# lines in KDEDIR/shutdown/agent-shutdown.sh to
# properly kill the agents when the session ends.

if [ -x /usr/bin/gpg-agent ]; then
  eval "$(/usr/bin/gpg-agent --daemon)"
fi 
#
if [ -x /usr/bin/ssh-agent ]; then
  eval "$(/usr/bin/ssh-agent -s)"
fi
