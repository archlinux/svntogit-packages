post_install() {
  echo 'Installing multiple non-conflicting Java environments is now supported.'
  echo 'Check the following wiki section for more info:'
  echo '  https://wiki.archlinux.org/index.php/Java#Multiple_official_Java_environments'
}

post_upgrade() {
  post_install "$@"
}
