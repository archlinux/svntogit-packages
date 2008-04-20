# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>
pkgname=aspell
pkgver=0.60.6
_pkgmajorver=0.60
pkgrel=1
pkgdesc="A Free and Open Source spell checker designed to eventually replace Ispell"
arch=(i686 x86_64)
license=('LGPL')
depends=('gcc-libs' 'ncurses')
options=(!libtool)
source=(ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz)
install=aspell.install
url="http://aspell.net/"
md5sums=('bc80f0198773d5c05086522be67334eb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  ln -s ${pkgname}-${_pkgmajorver} ${startdir}/pkg/usr/lib/${pkgname}
}
