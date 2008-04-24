# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem-plparser
pkgver=2.22.2
pkgrel=1
url="http://www.hadess.net/totem.php3"
pkgdesc="Totem playlist parser library"
license=('LGPL')
arch=(i686 x86_64)
depends=('evolution-data-server>=2.22.1')
makedepends=('perlxml')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/totem-pl-parser/2.22/totem-pl-parser-${pkgver}.tar.bz2)
md5sums=('d2f5e023de8d24c21e863dd7257594f0')

build() {
  cd ${startdir}/src/totem-pl-parser-${pkgver}
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
	      --localstatedir=/var \
	      --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
