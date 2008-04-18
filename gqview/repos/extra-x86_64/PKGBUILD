# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=gqview
pkgver=2.0.4
pkgrel=1
pkgdesc="An image browser and viewer"
arch=(i686 x86_64)
depends=('gtk2')
source=(http://heanet.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://gqview.sourceforge.net/"
md5sums=('7196deab04db94cec2167637cddc02f9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
