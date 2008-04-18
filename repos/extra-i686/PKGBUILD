# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=libtiff
pkgver=3.8.2
pkgrel=3
pkgdesc="Library for manipulation of TIFF images"
arch=(i686 x86_64)
depends=(libjpeg zlib)
makedepends=(libgl freeglut libxmu libxi)
options=(NOLIBTOOL)
url="http://www.libtiff.org/"
source=(ftp://ftp.remotesensing.org/pub/libtiff/tiff-${pkgver}.tar.gz
	tiff2pdf-octal-printf.patch
       	tiffsplit-fname-overflow.patch
	CVE-2006-3459-3465.patch
	tiff2pdf-compression.patch)
md5sums=('fbb6f446ea4ed18955e2714934e5b698' 'd54368687d2645ffbbe6c2df384b11bf'\
         '323352fd60a7bd3ffac8724c3c031669' '624d3067e6a4c0680767eb62253ea980'\
         'b443ffca9d498bb3a88c17da0200025b')

build() {
  cd ${startdir}/src/tiff-${pkgver}
  patch -Np1 -i ${startdir}/src/tiff2pdf-octal-printf.patch || return 1
  patch -Np1 -i ${startdir}/src/tiffsplit-fname-overflow.patch || return 1
  patch -Np1 -i ${startdir}/src/CVE-2006-3459-3465.patch || return 1
  patch -Np1 -i ${startdir}/src/tiff2pdf-compression.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
