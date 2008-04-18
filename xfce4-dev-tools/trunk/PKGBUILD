# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce4-dev-tools
pkgver=4.4.0.1
pkgrel=1
pkgdesc="Xfce developer tools"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-goodies')
depends=('gtk-doc' 'automake' 'make' 'intltool')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://mocha.xfce.org/archive/xfce-4.4.2/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7d09d161efc7ef86b3b48791d98c8ae8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
