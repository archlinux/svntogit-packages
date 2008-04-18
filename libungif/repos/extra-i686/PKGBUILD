# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Committer: Judd Vinet <jvinet@zeroflux.org>
pkgname=libungif
pkgver=4.1.4
pkgrel=1
pkgdesc="A library for reading and writing gif images without LZW compression"
depends=('glibc')
url="http://sourceforge.net/projects/libungif/"
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('efdfcf8e32e35740288a8c5625a70ccb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}
