# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=pmount
pkgver=0.9.13
pkgrel=4
pkgdesc="mount removable devices as normal user"
arch=(i686 x86_64)
url="http://www.piware.de/projects.shtml"
depends=('sysfsutils>=2.0.0-1' 'bash' 'hal>=0.5.8.1-2')
makedepends=('perlxml')
source=(http://www.piware.de/projects/${pkgname}-${pkgver}.tar.gz
	pmount-dbus-close.patch)
backup=('etc/pmount.allow')
md5sums=('978d1c996fb7f74e8bb953d5674ab691' 'b7ea1afd82ffebf510dc89f74cd39f09')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/pmount-dbus-close.patch || return 1
  ./configure --prefix=/usr --with-cryptsetup-prog=/usr/sbin/cryptsetup
  make || return 1 
  make DESTDIR=${startdir}/pkg install 
}
