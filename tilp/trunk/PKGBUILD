# $Id$
#Contributor: Simo Leone <neotuli@gmail.com>
pkgname=tilp
pkgver=1.10
pkgrel=1
pkgdesc="TI graphing calculator link/transfer program"
arch=(i686 x86_64)
url="http://tilp.info/"
license="GPL"
depends=('libglade' 'libticalcs')
options=('FORCE' 'NOLIBTOOL')
source=("http://www.archlinux.org/~simo/tilp/tilp2.tar.gz")
md5sums=('51f8082845606b3e16c291e9efc16116')

build() {
  cd $startdir/src/tilp2-$pkgver
#  LDFLAGS="${LDFLAGS:- -export-dynamic}" ; export LDFLAGS
#  ./configure --prefix=/usr --enable-exit-homedir --sysconfdir=/etc
#  sed -i "s/desktop//g" Makefile
#  mkdir -p $startdir/pkg/usr/lib/tilp
  ./configure --without-kde --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
