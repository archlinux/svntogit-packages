# $Id$
# Maintainer: Paul Mattal <paul@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=squirrelmail
pkgver=1.5.2cvs
pkgrel=6
_snapshot=20070903_0000
pkgdesc="Webmail for Nuts!"
arch=(i686 x86_64)
license=('GPL')
url="http://www.squirrelmail.org"
depends=('php' 'perl' 'imap-server')
makedepends=('findutils')
backup=(home/httpd/html/squirrelmail/.htaccess home/httpd/html/squirrelmail/config/config.php)
install=$pkgname.install
#source=(http://snapshots.squirrelmail.org/$pkgname-$_snapshot-SVN.devel.tar.bz2)
# since the snapshots go away quickly, mirror them
source=(http://www.archlinux.org/~paul/$pkgname-$_snapshot-SVN.devel.tar.bz2)
md5sums=('145077fcd51a1b41384df06b9cdd3fc9')

build() {
  # install
  mkdir -p $startdir/pkg/home/httpd/html/squirrelmail || return 1
  cd $startdir/pkg/home/httpd/html/squirrelmail || return 1
  cp -a $startdir/src/squirrelmail.devel/* . || return 1

  # remove CVS dirs
  find $startdir/pkg -type d -name CVS -exec rm -rf {} \; || return 1

  # customize config (data and attachments in /var/lib/squirrelmail)
  cd config || return 1
  cp -p config_default.php config.php || return 1
  sed -i 's|^$attachment_dir = $data_dir;|$attachment_dir = "/var/lib/squirrelmail/attachments";|' config.php || return 1
  sed -i 's|^$data_dir = "/var/local/squirrelmail/data";|$data_dir = "/var/lib/squirrelmail/data";|' config.php || return 1

  # create data and attachments directories, set ownership/permissions
  # ideally we would set attachments differently to root:-1 with 0730, but
  # I don't know how to get chgrp to take "-1" properly; perhaps someday
  # I'll figure out how to make this work
  mkdir -p $startdir/pkg/var/lib/squirrelmail/{data,attachments} || return 1
  chown -R nobody:nobody $startdir/pkg/var/lib/squirrelmail/data \
    || return 1
  chown -R nobody:nobody $startdir/pkg/var/lib/squirrelmail/attachments \
    || return 1
  chmod 0700 $startdir/pkg/var/lib/squirrelmail/data || return 1
  chmod 0300 $startdir/pkg/var/lib/squirrelmail/attachments || return 1

  # restrict access to squirrelmail by default
  echo "deny from all" >$startdir/pkg/home/httpd/html/squirrelmail/.htaccess \
    || return 1
}
# vim: ts=2 sw=2 et ft=sh
