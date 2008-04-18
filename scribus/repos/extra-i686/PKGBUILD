# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=scribus
pkgver=1.3.3.11
pkgrel=2
pkgdesc="A desktop publishing program"
arch=(i686 x86_64)
license=('GPL')
url="http://www.scribus.net"
install=${pkgname}.install
depends=('libcups>=1.2.10' 'lcms>=1.16' 'qt3>=3.3.8' 'ghostscript>=8.15.4' \
         'libart-lgpl>=2.3.19' 'python>=2.5' 'libxml2>=2.6.27' 'cairo' \
			'desktop-file-utils')
makedepends=('cmake')
options=(!libtool force !makeflags)
replaces=('scribus-devel')
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('472432b6ae85e005c98bc11c79572ec9')

build() {
  # Source the QT profile
  source /etc/profile.d/qt3.sh

  cd ${startdir}/src/scribus-${pkgver}
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
   -DWANT_CAIRO=1 -DLIB_SUFFIX=""
  make || return 1
  make DESTDIR=$startdir/pkg install

  install -Dm644 scribus.desktop \
    ${startdir}/pkg/usr/share/applications/scribus.desktop
}
