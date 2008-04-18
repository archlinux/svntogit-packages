# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=ypserv
pkgver=2.19
pkgrel=1
pkgdesc="NIS (formerly YP) provides a simple network lookup service consisting of databases and processes"
arch=(i686 x86_64)
url="http://www.linux-nis.org"
depends=('gdbm' 'openslp')
backup=('etc/ypserv.conf' 'etc/netgroup' 'var/yp/securenets')
source=(ftp://ftp.kernel.org/pub/linux/utils/net/NIS/$pkgname-$pkgver.tar.gz \
  ypserv yppasswd)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr YPMAPDIR=$startdir/pkg/var/yp \
    varypdir=$startdir/pkg/var/yp install
  install -D -m644 etc/netgroup $startdir/pkg/etc/netgroup
  install -D -m644 etc/ypserv.conf $startdir/pkg/etc/ypserv.conf
  install -D -m644 etc/securenets $startdir/pkg/var/yp/securenets
  install -D -m755 ../ypserv $startdir/pkg/etc/rc.d/ypserv
  install -D -m755 ../yppasswd $startdir/pkg/etc/rc.d/yppasswd
}
