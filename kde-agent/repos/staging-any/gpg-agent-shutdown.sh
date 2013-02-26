#!/bin/sh

## The nice way
if test -n "${GPG_AGENT_INFO}"; then
  GPG_AGENT_PID=`echo ${GPG_AGENT_INFO} | cut -d: -f2` && kill ${GPG_AGENT_PID} ||:
  unset GPG_AGENT_INFO
fi

## The not so nice way
## NOTE: a root login will kill *all* users' gpg-agents
#killall gpg-agent

## clean/remove .gpg-agent-info
rm -f $HOME/.gpg-agent-info
