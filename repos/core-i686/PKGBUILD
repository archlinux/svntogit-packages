# $Id$
# Maintainer: Judd <judd@archlinux.org>
pkgname=nano
pkgver=2.0.7
pkgrel=1
pkgdesc="Pico editor clone with enhancements"
arch=(i686 x86_64)
license=('GPL')
url="http://www.nano-editor.org"
groups=('base')
depends=('glibc' 'ncurses')
source=(http://www.nano-editor.org/dist/v2.0/nano-$pkgver.tar.gz nanorc)
backup=(etc/nanorc)
md5sums=('16187fed2bdefec6275ece6401ce4cd2'
         'd4d3842319075fdb832fc970d556099e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --enable-color --enable-nanorc --enable-multibuffer
  make || return 1
  make DESTDIR=$startdir/pkg install
#  install -DTm644 $startdir/src/nanorc $startdir/pkg/etc/nanorc
  install -DTm644 $startdir/src/$pkgname-$pkgver/doc/nanorc.sample $startdir/pkg/etc/nanorc
}
