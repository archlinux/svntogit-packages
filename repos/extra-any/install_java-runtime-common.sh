post_install() {
  echo 'For the complete set of Java binaries to be available in your PATH,'
  echo 'you need to re-login or source /etc/profile.d/jre.sh'
  echo 'Please note that this package does not support forcing JAVA_HOME as former package 'java-common' did'
}

post_upgrade() {
  archlinux-java fix
}
