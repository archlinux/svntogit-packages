# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Chaiwat Suttipongsakul <cwt114@gmail.com>
pkgname=libthai
pkgver=0.1.9
pkgrel=1
pkgdesc="Thai language support routines"
url="http://linux.thai.net/projects/libthai"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libdatrie>=0.1.2')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
source=(http://linux.thai.net/pub/thailinux/software/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7002d111b293f202d20b28aa2b4ed68f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
