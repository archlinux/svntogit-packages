# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
pkgname=aspell
pkgver=0.60.5
_pkgmajorver=0.60
pkgrel=2
pkgdesc="A Free and Open Source spell checker designed to eventually replace Ispell"
arch=(i686 x86_64)
license=('LGPL')
depends=('gcc-libs' 'ncurses')
options=(!libtool)
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
install=aspell.install
url="http://aspell.net/"
md5sums=('17fd8acac6293336bcef44391b71e337')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  ln -s ${pkgname}-${_pkgmajorver} ${startdir}/pkg/usr/lib/${pkgname}
}
