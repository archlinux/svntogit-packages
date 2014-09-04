JVM_DIR=/usr/lib/jvm
OLD_DEFAULT_NAME=java-default-runtime
OLD_DEFAULT_PATH=${JVM_DIR}/${OLD_DEFAULT_NAME}
DEFAULT_NAME=default
DEFAULT_PATH=${JVM_DIR}/${DEFAULT_NAME}
DEFAULT_NAME_JRE=default-runtime
DEFAULT_PATH_JRE=${JVM_DIR}/${DEFAULT_NAME_JRE}

# $1: Java environment name to set as default
set_default_link_to() {
  new_default=$1
  unlink ${DEFAULT_PATH} 2>/dev/null
  ln -sf ${new_default} ${DEFAULT_PATH}

  unlink ${DEFAULT_PATH_JRE} 2>/dev/null
  if [[ ${new_default} == */jre ]]; then
    ln -sf ${new_default} ${DEFAULT_PATH_JRE}
  else
    ln -sf ${new_default}/jre ${DEFAULT_PATH_JRE}
  fi
}

pre_install() {
  _curr_def=$(readlink ${OLD_DEFAULT_PATH} && true)
  if [ -n "${_curr_def}" ]; then
    unlink ${OLD_DEFAULT_PATH} > /dev/null 2>&1
    ln -sf ${DEFAULT_NAME} ${OLD_DEFAULT_PATH}

    set_default_link_to ${_curr_def}
  fi
}

pre_upgrade() {
  pre_install "$@"
}

post_install() {
  echo 'Installing multiple non-conflicting Java environments is now supported'
  echo 'Check the following wiki section for more info:'
  echo '  https://wiki.archlinux.org/index.php/Java'
  echo 'Please make sure JAVA_HOME is set to /usr/lib/jvm/default'
  echo 'If not, you may have to logout and login again to set it according to /etc/profile.d/jre.sh'
}

post_upgrade() {
  post_install "$@"
}
