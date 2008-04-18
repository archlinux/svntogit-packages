# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Alexander 'dma147' Mieland <dma147@linux-stats.org>
# Contributor: Simon Morgan <simon@16hz.net>
pkgname=chmlib
pkgver=0.39
pkgrel=1
pkgdesc="Library for dealing with Microsoft ITSS/CHM format files"
arch=(i686 x86_64)
url="http://morte.jedrea.com/~jedwin/projects/chmlib/"
options=('nolibtool' 'noemptydirs')
license=(LGPL)
depends=('glibc')
source=(http://morte.jedrea.com/~jedwin/projects/chmlib/${pkgname}-${pkgver}.tar.bz2)
md5sums=('debed1a0bdded7a12d3d967e497cea9c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-examples=yes
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
