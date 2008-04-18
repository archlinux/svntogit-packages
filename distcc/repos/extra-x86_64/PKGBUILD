# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
pkgname=distcc
pkgver=2.18.3
pkgrel=2
pkgdesc="A distributed C, C++, Obj C compiler"
arch=(i686 x86_64)
url="http://distcc.samba.org"
depends=(popt gcc)
makedepends=(gtk2 pkgconfig)
backup=(etc/conf.d/distccd)
source=(http://distcc.samba.org/ftp/distcc/$pkgname-$pkgver.tar.bz2 distccd distccd.conf.d)
md5sums=('0d6b80a1efc3a3d816c4f4175f63eaa2' '1c918474372c09304772c20c4de484fa'\
         '89aaf6e9072092e283465a14e83f0f94')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-gtk --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ../distccd.conf.d $startdir/pkg/etc/conf.d/distccd
  install -D -m755 ../distccd $startdir/pkg/etc/rc.d/distccd

  mkdir -p $startdir/pkg/usr/lib/${pkgname}/bin
  ln -sf /usr/bin/${pkgname} $startdir/pkg/usr/lib/${pkgname}/bin/cc
  ln -sf /usr/bin/${pkgname} $startdir/pkg/usr/lib/${pkgname}/bin/gcc
  ln -sf /usr/bin/${pkgname} $startdir/pkg/usr/lib/${pkgname}/bin/g++
  ln -sf /usr/bin/${pkgname} $startdir/pkg/usr/lib/${pkgname}/bin/cpp
}
