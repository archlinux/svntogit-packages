# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=openbox
pkgver=3.4.6.1
pkgrel=2
pkgdesc="A window manager for the X11 windowing system"
arch=(i686 x86_64)
license=('GPL')
depends=('startup-notification' 'libxml2' 'libxinerama' 'libxrandr' \
         'libxcursor' 'pango')
url="http://icculus.org/openbox"
install=openbox.install
options=('!libtool')
backup=('usr/etc/xdg/openbox/menu.xml' 'usr/etc/xdg/openbox/rc.xml')
source=(http://www.icculus.org/openbox/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('0000c3a72d9fb956128cee7fd27ff19f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-x \
    --enable-startup-notification --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install
  sed -i "s:startkde:/opt/kde/bin/\0:" ${startdir}/pkg/usr/share/xsessions/openbox-kde.desktop
  sed -i "s:=gnome-session:=/usr/bin/gnome-session:" ${startdir}/pkg/usr/share/xsessions/openbox-gnome.desktop
}
