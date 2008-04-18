# $Id$
# Maintainer: Juergen Hoetzel  <juergen@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=gts
pkgver=0.7.6
pkgrel=1
pkgdesc="GNU Triangulated Surface Library"
arch=(i686 x86_64)
url="http://gts.sourceforge.net/"
depends=('glib2' 'bash')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9f710aefd2ed9b3cc1b1216171fc5a8a')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
# vim: ft=sh ts=2 et
