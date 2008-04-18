# $Id$
# Maintainer: James Rayner <james@archlinux.org>
# Contributor: Christian Storm <Christian.Storm@gmx.DE>
pkgname=vbetool
pkgver=1.0
pkgrel=2
pkgdesc="vbetool uses lrmi in order to run code from the video BIOS"
arch=('i686' 'x86_64')
url="http://www.srcf.ucam.org/~mjg59/vbetool/"
license=('GPL2')
depends=('zlib' 'libx86')
makedepends=('pciutils')
source=(http://www.codon.org.uk/~mjg59/vbetool/download/vbetool-${pkgver}.tar.gz)


build() {
  cd $startdir/src/vbetool-$pkgver
  if [ "${CARCH}" = "x86_64" ]; then
    ./configure --prefix=/usr --without-x86emu
  else
    ./configure --prefix=/usr
  fi
  make LIBS=-lpci || return 1
  make DESTDIR=$startdir/pkg install
}






md5sums=('e57b5475b8200e3c44df7f53f0fbdc72')
