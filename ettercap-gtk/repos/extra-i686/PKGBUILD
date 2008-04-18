# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=ettercap-gtk
pkgver=NG_0.7.3
_origname=ettercap
_origver=NG-0.7.3
pkgrel=2
pkgdesc="A network sniffer/interceptor/logger for ethernet LANs - GTK"
arch=(i686 x86_64)
url="http://ettercap.sourceforge.net/"
license=('GPL')
# Other deps are included by ettercap.
depends=("ettercap=${pkgver}" 'gtk2')
makedepends=('libnet')
options=(!libtool)
source=(http://heanet.dl.sourceforge.net/sourceforge/${_origname}/${_origname}-${_origver}.tar.gz ettercap.desktop)
md5sums=('28fb15cd024162c55249888fe1b97820' '6ef18fdd114297d4ed9e5104d309f071')

build() {
  cd $startdir/src/${_origname}-${_origver}
  ./configure --prefix=/usr --sysconfdir=/etc --enable-plugins --enable-https
  make || return 1
  install -D ${startdir}/src/${_origname}-${_origver}/src/ettercap \
             ${startdir}/pkg/usr/bin/ettercap-gtk
  install -D ${startdir}/src/ettercap.desktop \
             ${startdir}/pkg/usr/share/applications/ettercap.desktop
}
