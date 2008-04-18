# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=imlib
pkgver=1.9.15
pkgrel=4
pkgdesc="General image handling library for X11 and Gtk"
arch=(i686 x86_64)
url="http://www.enlightenment.org/Libraries/Imlib.html"
license=('GPL')
depends=(gtk libungif libpng libtiff libsm)
source=(http://ftp.gnome.org/pub/GNOME/sources/imlib/1.9/$pkgname-$pkgver.tar.bz2
        debian-bug448360.patch CAN-2004-1026.patch aclocal-fixes.patch)
options=(!libtool)
md5sums=('7db987e6c52e4daf70d7d0f471238eae'
         '5f9da697934b6bd3b497ac9160ce4f5c'
         'b273d36aa60adbfaacaf6062234e4c1f'
         '33b832f0dc6c9723cd0dfe9c8d0a6797')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ${startdir}/src/debian-bug448360.patch || return 1
  patch -Np1 -i ${startdir}/src/CAN-2004-1026.patch || return 1
  patch -Np0 -i ${startdir}/src/aclocal-fixes.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shm
  make || return 1
  make DESTDIR=$startdir/pkg install
}
