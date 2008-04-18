# $Id$
# Maintainer: Tobias Kieslich

pkgname=notification-daemon-xfce
pkgver=0.3.7
pkgrel=2
pkgdesc="notification daemon for the xfce desktop"
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/applications/notification-daemon-xfce"
groups=('xfce4-goodies')
depends=('libxfcegui4' 'libsexy' 'libnotify')
makedepends=('pkgconfig' 'xfce-mcs-manager')
provides=('notification-daemon')
conflicts=('notification-daemon')
options=('!libtool')
install=${pkgname}.install
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ef4a4977875d97a5237b316d5d592176')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
     --localstatedir=/var --disable-static --enable-gradient-look
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
