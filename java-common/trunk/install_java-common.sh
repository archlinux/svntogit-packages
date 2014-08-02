post_install() {
  echo 'Installing multiple non-conflicting Java environments is now supported'
  echo 'Check the following wiki section for more info:'
  echo '  https://wiki.archlinux.org/index.php/Java#Multiple_official_Java_environments'
  echo 'Please make sure JAVA_HOME is set to /usr/lib/jvm/java-default-runtime'
  echo 'If not, you may have to logout and login again to set it according to /etc/profile.d/jre.sh'
}

post_upgrade() {
  post_install "$@"
}
