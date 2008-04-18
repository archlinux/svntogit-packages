# $Id$
# Maintainer: Arjan Timmerman <arjan@archlinux.org>

pkgname=netspeed-applet
pkgver=0.14
pkgrel=2
pkgdesc="Little GNOME applet that shows how much traffic occurs on a specified network device."
arch=(i686 x86_64)
license=('GPL')
url="http://www.wh-hms.uni-ulm.de/~mfcn/netspeed/"
depends=('gnome-panel>=2.18.1' 'libgtop>=2.14.8-2' 'scrollkeeper')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.10.3')
install=netspeed-applet.install
source=(http://www.wh-hms.uni-ulm.de/~mfcn/shared/netspeed/netspeed_applet-${pkgver}.tar.gz)
md5sums=('e542f9b4a42f13833b9972520dfe0ac9')

build() {
  cd $startdir/src/netspeed_applet-${pkgver}
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/netspeed-applet \
              --localstatedir=/var --disable-scrollkeeper
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
