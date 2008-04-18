# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-battery-plugin
pkgver=0.5.0
pkgrel=5
pkgdesc="A battery monitor plugin for the Xfce panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c1d923bb90b79087ca7044bcc24bab5a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
 # the purpose of this code is to check if there is an acpi system installed at all
 # but since the code also exits when no /proc/acpi/battery directory is there we are safe
  ex panel-plugin/libacpi.c << EOC > /dev/null 2>&1
/proc.acpi.info
d10
w
q
EOC
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
