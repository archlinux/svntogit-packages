# $Id$
# AUR-Maintainer: William Rea <sillywilly@gmail.com>
# Contributor: SleepyDog

pkgname=glew
pkgver=1.5.0
pkgrel=1
pkgdesc="A cross-platform C/C++ extension loading library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
depends=('libxmu' 'libxi' 'mesa')
license=('custom')
source=(http://dl.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tgz license.txt)
md5sums=('3fececda0151b060c08ffd8a12892741' '5539e73b829f051bc6436c61fedc53ba')

build() {
  cd ${startdir}/src/${pkgname}
  make || return 1
  make GLEW_DEST=${startdir}/pkg/usr LIBDIR=${startdir}/pkg/usr/lib install
  install -D -m644 ${startdir}/src/license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
