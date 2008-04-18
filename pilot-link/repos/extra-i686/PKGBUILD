# $Id$
# Maintainer: dale <dale@archlinux.org>

# todo: add perl support, DESTDIR has no affect on perl
# and it seems that moving the files manually doesn't work

pkgname=pilot-link
pkgver=0.12.3
pkgrel=1
pkgdesc="A suite of tools for connecting to PalmOS handheld devices"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('readline' 'libpng' 'libusb' 'popt')
options=('!libtool')
url=http://www.pilot-link.org/
source=(http://downloads.pilot-link.org/${pkgname}-${pkgver}.tar.bz2)
md5sums=('257124484d50552679c53cae8e118aa3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-conduits --enable-libusb \
    --with-libiconv --with-libpng || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
