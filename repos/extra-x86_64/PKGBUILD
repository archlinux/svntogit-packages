# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=mpg123
pkgver=1.4.1
pkgrel=1
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mpg123"
license=('GPL2' 'LGPL2')
depends=('glibc' 'libtool>=2.2' 'alsa-lib')
makedepends=('esd' 'sdl')
optdepends=('esd: for additional audio support' 'sdl: for additional audio support')
conflicts=('mpg321')
provides=('mpg321')
replaces=('mpg321')
options=('libtool')
source=(http://downloads.sourceforge.net/sourceforge/mpg123/${pkgname}-${pkgver}.tar.bz2)
md5sums=('df541f2daf1e8c356b52be2edb2ad10b')
sha1sums=('b9a89cba45652d013262c7744edc1f07b16203d5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-audio="alsa esd sdl"
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
