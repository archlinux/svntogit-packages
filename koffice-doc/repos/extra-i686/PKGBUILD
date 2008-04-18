# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=koffice-doc
pkgver=1.6.3
stable=stable # stable|unstable
pkgrel=2
pkgdesc="Documentation for Koffice"
license=('GPL')
arch=(i686 x86_64)
url="http://www.koffice.org"
depends=('koffice>=1.6.3')
makedepends=('pkgconfig')
source=(http://download.kde.org/stable/koffice-${pkgver}/src/koffice-${pkgver}.tar.bz2)

build() {
  # Source the QT and KDE profile
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt.sh
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde.sh

  cd ${startdir}/src/koffice-${pkgver}

  ./configure --prefix=/opt/kde --enable-new-ldflags --disable-debug
 
  cd doc
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm -rf ${startdir}/pkg/opt/kde/share/applications
}
md5sums=('386d388094734f9759977c3267098e30')

