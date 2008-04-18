# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=netcdf
pkgver=3.6.2
pkgrel=2
pkgdesc="network Common Data Form interface for array-oriented data access and corresponding library"
arch=("i686" "x86_64")
url="http://my.unidata.ucar.edu/content/software/netcdf/index.html"
depends=('gcc-libs>=4.3.0')
options=('force' '!libtool' '!makeflags')
license=('custom')
source=(http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${pkgver}.tar.gz
	string-include.patch)
md5sums=('a7d450da9081e4a6e440705ea31868d3'
         'eafa1dd0b97a520227414e91c5fecc1b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/string-include.patch || return 1
  ./configure --prefix=/usr --enable-shared
  make || return 1
  make check || return 1
  install -m755 -d ${startdir}/pkg/usr/lib
  install -m755 -d ${startdir}/pkg/usr/share/man
  make DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYRIGHT ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
