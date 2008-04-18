# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.0.1
pkgrel=1
pkgdesc="An XML Parser library written in C"
arch=(i686 x86_64)
license=('custom')
depends=('glibc')
options=('!libtool')
source=(http://heanet.dl.sourceforge.net/sourceforge/expat/${pkgname}-${pkgver}.tar.gz)
url="http://expat.sourceforge.net/"
md5sums=('ee8b492592568805593f81f8cdf2a04c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -m644 -D COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
