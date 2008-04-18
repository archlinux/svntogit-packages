# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Eric Johnson <eric@coding-zone.com>

pkgname=words
pkgver=1.0
pkgrel=4
pkgdesc="A collection of International 'words' files for /usr/share/dict"
depends=('util-linux')
source=(http://www.coding-zone.com/$pkgname-$pkgver.tar.gz)
install=$pkgname.install
url="http://www.coding-zone.com/words.phtml"
md5sums=('0877eb863da984003a931cee7fd3aaad')

build() {
  cd $startdir/src
  /bin/mkdir -p $startdir/pkg/usr/share/dict
	/bin/cp * $startdir/pkg/usr/share/dict
	/bin/rm $startdir/pkg/usr/share/dict/README
	/bin/rm $startdir/pkg/usr/share/dict/*.tar.gz
  # create empty place holder - this will be replaced with a
  # symlink pointing to the locale's lang during install
  #
  /bin/touch $startdir/pkg/usr/share/dict/words
}
# vim: ts=2 sw=2 et ft=sh
