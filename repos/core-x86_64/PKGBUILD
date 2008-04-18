# $Id$
# Maintainer: Judd <jvinet@zeroflux.org>
pkgname=nfsidmap
pkgver=0.20
pkgrel=2
pkgdesc="Library to help mapping IDs, mainly for NFSv4"
arch=(i686 x86_64)
url="http://www.citi.umich.edu/projects/nfsv4/linux/"
depends=('glibc' 'libldap')
license=('custom:nfsidmap')
source=(http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/libnfsidmap-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $startdir/src/lib$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
  # install license
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/nfsidmap/LICENSE
}