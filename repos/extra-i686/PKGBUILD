# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=alsa-utils
pkgver=1.0.16
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=(i686 x86_64)
url="http://www.alsa-project.org"
depends=('alsa-lib>=1.0.16' 'dialog' 'pciutils' 'ncurses')
license=('GPL')
source=(ftp://ftp.alsa-project.org/pub/utils/$pkgname-${pkgver}.tar.bz2 \
        alsa alsaconf.patch alsa.conf.d)
backup=(etc/conf.d/alsa)
md5sums=('b9f803f45e6988bb27a6bed521a949fc'
         'cce0969b0203a2bb35540fdf4f7e96ae'
         '538f82650d08e901efea86c5395520df'
         '366d370f874a45e67b63ce4a8b048202')

build() {
  cd $startdir/src/$pkgname-${pkgver}
  patch -Np1 -i ../alsaconf.patch || return 1
  ./configure --prefix=/usr --with-curses=ncursesw
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 ../alsa $startdir/pkg/etc/rc.d/alsa
  install -D -m644 ../alsa.conf.d $startdir/pkg/etc/conf.d/alsa
}
