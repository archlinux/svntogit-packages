# $Id$
#Contributor: Simo Leone <neotuli@gmail.com>
pkgname=libtifiles
pkgver=1.1.0
pkgrel=1
pkgdesc="TI File format library"
arch=(i686 x86_64)
url="http://tilp.info"
license="GPL"
depends=('zlib' 'libticonv' 'glib2')
options=('FORCE' 'NOLIBTOOL')
source=(http://www.archlinux.org/~simo/tilp/tilibs2/libtifiles2-$pkgver.tar.gz)
md5sums=('f646b6c7a354bc594f20e5f6698565c9')

build() {
  cd $startdir/src/libtifiles2-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
