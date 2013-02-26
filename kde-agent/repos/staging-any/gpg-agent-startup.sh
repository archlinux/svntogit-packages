#!/bin/sh

GPG_AGENT=/usr/bin/gpg-agent
## Run gpg-agent only if not already running, and available
if [ -x "${GPG_AGENT}" ] ; then

  # check validity of GPG_SOCKET (in case of session crash)
  GPG_AGENT_INFO_FILE=${HOME}/.gpg-agent-info
  if [ -f "${GPG_AGENT_INFO_FILE}" ]; then
    GPG_AGENT_PID=`cat ${GPG_AGENT_INFO_FILE} | grep GPG_AGENT_INFO | cut -f2 -d:`
    GPG_PID_NAME=`cat /proc/${GPG_AGENT_PID}/comm`
    if [ ! "x${GPG_PID_NAME}" = "xgpg-agent" ]; then
      rm -f "${GPG_AGENT_INFO_FILE}" 2>&1 >/dev/null
    else
       GPG_SOCKET=`cat "${GPG_AGENT_INFO_FILE}" | grep GPG_AGENT_INFO | cut -f1 -d: | cut -f2 -d=`
       if ! test -S "${GPG_SOCKET}" -a -O "${GPG_SOCKET}" ; then
         rm -f "${GPG_AGENT_INFO_FILE}" 2>&1 >/dev/null
       fi
    fi
    unset GPG_AGENT_PID GPG_SOCKET GPG_PID_NAME
  fi

  if [ -f "${GPG_AGENT_INFO_FILE}" ]; then
    eval "$(cat "${GPG_AGENT_INFO_FILE}")"
    eval "$(cut -d= -f 1 "${GPG_AGENT_INFO_FILE}" | xargs echo export)"
    export GPG_TTY=$(tty)
  else
    eval "$(${GPG_AGENT} -s --daemon --pinentry-program /usr/bin/pinentry-qt4 --write-env-file)"
  fi

fi
