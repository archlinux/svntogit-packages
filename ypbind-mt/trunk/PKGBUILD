# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=ypbind-mt
pkgver=1.20.4
pkgrel=1
pkgdesc="A multi-threaded implementation of a NIS binding daemon"
arch=(i686 x86_64)
url="http://www.linux-nis.org"
depends=('portmap' 'openslp')
backup=('etc/yp.conf')
source=(ftp://ftp.kernel.org/pub/linux/utils/net/NIS/$pkgname-$pkgver.tar.bz2 \
        ypbind)
md5sums=('266d2fb625d5511c4c5cc54a03bea00a' '860c96e4ac9354dcf4ca691d6218c469')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-dbus-nm
  make || return 1
  make prefix=$startdir/pkg/usr install
  install -D -m644 etc/yp.conf $startdir/pkg/etc/yp.conf
  install -D -m755 ../ypbind $startdir/pkg/etc/rc.d/ypbind
  install -d -m755 $startdir/pkg/var/yp/binding
}
