post_install() {
  echo 'Please make sure JAVA_HOME is set to /usr/lib/jvm/default'
  echo 'If not, you may have to logout and login again to set it according to /etc/profile.d/jre.sh'
}

post_upgrade() {
  post_install "$@"
}
