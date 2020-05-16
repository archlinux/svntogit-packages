pre_upgrade() {
  if grep -q '^export _JAVA_AWT_WM_NONREPARENTING=1' /etc/profile.d/jre.sh > /dev/null 2>&1; then
    echo "Variable '_JAVA_AWT_WM_NONREPARENTING' should not be set in /etc/profile.d/jre.sh any more"
    echo "Please declare it in ~/.xinitrc or such"
  fi
}

post_install() {
  echo 'For the complete set of Java binaries to be available in your PATH,'
  echo 'you need to re-login or source /etc/profile.d/jre.sh'
  echo 'Please note that this package does not support forcing JAVA_HOME as former package 'java-common' did'
}

post_upgrade() {
  archlinux-java fix
}
