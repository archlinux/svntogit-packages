# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=scim-uim
pkgver=0.2.0
pkgrel=2
pkgdesc="UIM bridging input engine for SCIM"
arch=(i686 x86_64)
url="http://www.scim-im.org/"
license=('GPL')
depends=('scim>=1.4.7' 'uim>=1.4.2')
source=("http://switch.dl.sourceforge.net/sourceforge/scim/$pkgname-$pkgver.tar.gz" 'scim-uim-0.2.0-fix-gcc43-build.patch')
md5sums=('3841556bc0e5a94b1a268751432712d3' '969da6727ec7cffc7d5a5de98eeb1f6b')
options=(!libtool)

build() {
  cd $startdir/src
  patch -Np0 -i scim-uim-0.2.0-fix-gcc43-build.patch  || return 1
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make || return 1
  make DESTDIR=$startdir/pkg install
}


