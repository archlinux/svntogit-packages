# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=libexif
pkgver=0.6.16
pkgrel=1
pkgdesc="A library to parse an EXIF file and read the data from those tags"
arch=(i686 x86_64)
license=('LGPL')
url="http://sourceforge.net/projects/libexif"
depends=('glibc')
options=('!libtool')
source=(http://downloads.sf.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('deee153b1ded5a944ea05d041d959eca')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
