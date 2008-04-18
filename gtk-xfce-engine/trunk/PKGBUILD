# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=gtk-xfce-engine
pkgver=2.4.2
pkgrel=1
pkgdesc="A port of Xfce engine to GTK+-2.0"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('gtk2')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://www.xfce.org/archive/xfce-4.4.2/src/${pkgname}-${pkgver}.tar.bz2 \
        ftp://ftp.archlinux.org/other/xfce4-graphics/ArchLinux-xfce4-gtk2.tar.gz)
md5sums=('00eb6a62defe6867d28a18569b96d151' '71481fef064c74041f4529589a98875c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/themes
  cp -R ../ArchLinux ${startdir}/pkg/usr/share/themes
}
