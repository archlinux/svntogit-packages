# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=dbus-qt3
pkgver=0.62
pkgrel=3
pkgdesc="QT3 bindings for DBUS"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freedesktop.org/software/dbus"
depends=('qt3' 'dbus>=1.0.2')
makedepends=('pkgconfig')
options=('!libtool')
source=(ftp://ftp.archlinux.org/other/dbus/dbus-qt3_0.62.git.20060814.orig.tar.gz
	dbus-qt3-compile-fix-thoenig-01.patch
	dbus-qt3-do-not-close-shared-connection-thoenig-01.patch)
md5sums=('bdc61add46f64238fdc68a15e5f7269c'
         '6c7a45865568340ee601d31e184653c1'
         '9252c03a00d751201e53839d6a8ef78f')

build() {
  . /etc/profile.d/qt3.sh
  cd ${startdir}/src/${pkgname}-${pkgver}/qt3
  patch -Np1 -i ${startdir}/src/dbus-qt3-compile-fix-thoenig-01.patch || return 1
  patch -Np1 -i ${startdir}/src/dbus-qt3-do-not-close-shared-connection-thoenig-01.patch || return 1
  cd ..
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  sed -e "s|DBUS_QT3_LIBS =|DBUS_QT3_LIBS = -L${QTDIR}/lib -lqt-mt|" \
      -i Makefile qt3/Makefile || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
