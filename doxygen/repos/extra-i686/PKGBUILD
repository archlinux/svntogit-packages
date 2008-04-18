# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=doxygen
pkgver=1.5.5
pkgrel=1
pkgdesc="A documentation system for C++, C, Java, IDL and PHP"
license=('GPL')
arch=(i686 x86_64)
url="http://www.doxygen.org/"
depends=('gcc-libs')
# qt required to build and run doxywizard, but don't want to drag it in
makedepends=('flex' 'qt3')
install=doxygen.install
source=(ftp://ftp.stack.nl/pub/users/dimitri/${pkgname}-${pkgver}.src.tar.gz)
md5sums=('95813ecd95b371d13d63844ddb9b5c46')

build() {
  . /etc/profile.d/qt3.sh
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix /usr --with-doxywizard
  make || return 1
  make INSTALL=${startdir}/pkg/usr install
}
