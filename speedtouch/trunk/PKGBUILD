# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>
pkgname=speedtouch
pkgver=1.3.1
pkgrel=1
pkgdesc="Driver for the ADSL Speed Touch USB modem"
depends=('bash')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2)
url="http://speedtouch.sourceforge.net/"
md5sums=('0848a120ae0eeab6c8ab378e11dc4fa2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make prefix=$startdir/pkg/usr sysconfdir=$startdir/pkg/etc install || return 1
}
