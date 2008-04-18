# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=startup-notification
pkgver=0.9
pkgrel=1
pkgdesc="Monitor and display application startup"
arch=(i686 x86_64)
depends=('libx11' 'libsm')
options=('nolibtool')
url="http://www.freedesktop.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('624b42f1fac5a12c543a079e2cd3b366')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
