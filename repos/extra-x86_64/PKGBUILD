# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfdesktop
pkgver=4.4.2
pkgrel=2
pkgdesc="A desktop manager for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.2' 'libxfce4mcs>=4.4.2' 'libxml2' 'thunar>=0.9')
makedepends=('xfce4-panel>=4.4.2' 'xfce-mcs-manager>=4.4.2' 'pkgconfig')
conflicts=('xfce4-menueditor')
replaces=('xfce4-menueditor')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2 \
        ftp://ftp.archlinux.org/other/xfce4-graphics/ArchLinux-xfce4-backdrops.tar.gz)
md5sums=('694601234e74903d0fccba064f411e0c' 'e353bb20d5a1fd3e37be69a2213f5436')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/modules/menu
  wget http://svn.xfce.org/index.cgi/xfce/diff/xfdesktop/branches/xfce_4_4/modules/menu/desktop-menu-dentry.c\?rev1=26634\;rev2=26635\;mime=text\/plain -O x.patch
  patch -Np0 -i x.patch || return 1
  rm x.patch
  cd ../..
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D ../ArchLinux.png ${startdir}/pkg/usr/share/xfce4/backdrops/ArchLinux.png
}
