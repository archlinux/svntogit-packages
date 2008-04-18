# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=xvattr
pkgver=1.3
pkgrel=1
pkgdesc="Adjust attributes associated with the Xv extension to XFree86"
depends=('gtk')
source=(http://www.dtek.chalmers.se/~dvd/dist/$pkgname-$pkgver.tar.gz)
url="http://www.dtek.chalmers.se/~dvd/"
md5sums=('041e0d1f2ebce216e69e08ce78ec2ceb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
