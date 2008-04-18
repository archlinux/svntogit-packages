# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ccscript3
pkgver=1.1.0
pkgrel=1
pkgdesc="GNU ccScript"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ccscript"
license=('GPL2')
depends=('commoncpp2')
replaces=('ccscript')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/gnutelephony/$pkgname-$pkgver.tar.gz)
md5sums=('cee1b87d146d2abb82379f5c65d22f3b')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
