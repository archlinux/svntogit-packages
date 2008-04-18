# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfwm4
pkgver=4.4.2
pkgrel=2
pkgdesc="Xfce window manager, compatible with Gnome, Gnome2, KDE2, and KDE3"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.2' 'libxfce4mcs>=4.4.2' 'libxdamage' 'libxpm' \
         'libxcomposite' 'libxext' 'librsvg')
makedepends=('xfce-mcs-manager' 'pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2 \
        ftp://ftp.archlinux.org/other/xfce4-graphics/ArchLinux-xfce4-xfwm4.tar.gz \
        http://svn.xfce.org/index.cgi/xfce/diff/xfwm4/trunk/src/events.c\?rev1=26059\;rev2=26060\;mime=text%2Fplain )
md5sums=('21da77e50b07e72bba784bf3418ca067' '8ed0d3c7dc07dde88ba7b38ce5006730' \
         'cbceeaf790553ec5ce723362c51a7190')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/src
  patch -Np0 -i ../../events.c\?rev1=26059\;rev2=26060\;mime=text%2Fplain || return 1
  cd ..
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static \
    --enable-compositor --enable-xsync
  make || return 1
  make DESTDIR=${startdir}/pkg install
  cp -R ../ArchLinux ${startdir}/pkg/usr/share/themes
}
