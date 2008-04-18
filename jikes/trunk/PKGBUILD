# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jason Chu <jason@archlinux.org>

pkgname=jikes
pkgver=1.22
pkgrel=2
pkgdesc="Java compiler written in C"
arch=(i686 x86_64)
source=(http://heanet.dl.sourceforge.net/jikes/${pkgname}-${pkgver}.tar.bz2
	jikes)
url="http://www-124.ibm.com/developerworks/oss/jikes/"
depends=('gcc-gcj')
md5sums=('cda958c7fef6b43b803e1d1ef9afcb85' 'adc932cbcfb46e15ef2ff0bd7e862f1c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mv ${startdir}/pkg/usr/bin/jikes ${startdir}/pkg/usr/bin/jikes-bin
  install -m755 ${startdir}/src/jikes ${startdir}/pkg/usr/bin/
}
