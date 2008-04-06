# $id$
# Maintainer:

pkgname=tsocks
pkgver=1.8beta5
pkgrel=1
pkgdesc="a transparent SOCKS proxying library"
url="http://tsocks.sourceforge.net"
license="GPL"
depends=('glibc')
source=(http://ftp1.sourceforge.net/tsocks/tsocks-$pkgver.tar.gz)
md5sums=('51caefd77e5d440d0bbd6443db4fc0f8')

build() {
  cd $startdir/src/tsocks-1.8
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/lib $startdir/pkg/usr
}
