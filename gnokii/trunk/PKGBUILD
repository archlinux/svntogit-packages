# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=gnokii
pkgver=0.6.22
pkgrel=3
pkgdesc="Tools and user space driver for use with mobile phones"
arch=('i686' 'x86_64')
url="http://www.gnokii.org/"
license=('GPL')
depends=('libusb' 'libxpm' 'bluez-libs>=3.7')
makedepends=('gtk2>=2.10.14')
backup=(etc/gnokiirc)
source=(http://www.gnokii.org/download/gnokii/gnokii-${pkgver}.tar.bz2 gnokii.patch)
md5sums=('15d64a4911735ee30c03a7bfa9b60f05'
         '4d764727686ee34bc73489c8b1321c82')
options=('!libtool' '!makeflags')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/gnokii.patch
  ./configure --prefix=/usr --sysconfdir=/etc --enable-security
  make || return 1
  make DESTDIR=${startdir}/pkg install install-includes
  install -D -m644 ${startdir}/src/gnokii-${pkgver}/Docs/sample/gnokiirc ${startdir}/pkg/etc/gnokiirc
}
