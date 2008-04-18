# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xalf
pkgver=0.12
pkgrel=2
pkgdesc="Provides graphical feedback when starting X11 applications"
depends=('libxml2' 'libgtop' 'gtk')
source=(http://www.lysator.liu.se/~astrand/projects/$pkgname/$pkgname-$pkgver.tgz)
url="http://www.lysator.liu.se/~astrand/projects/xalf/"
md5sums=('301cd4481dfb4a4a3b1e5291e15c32fc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  find $startdir/pkg -name '*\.la' -exec rm {} \;
}
