# $Id$
# Maintainer: Jan de Groot <jan@jgc.homeip.net>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=nicotine
pkgver=1.2.9
pkgrel=1
pkgdesc="Soulseek music-sharing client, written in python"
license=('GPL')
arch=('i686' 'x86_64')
depends=('pygtk>=2.10.6-1' 'pyvorbis>=1.4-3' 'python-geoip>=1.2.1-2')
conflicts=(nicotine-plus)
replaces=(nicotine-plus)
url="http://nicotine-plus.sourceforge.net"
source=(http://downloads.sf.net/${pkgname}-plus/${pkgname}+-${pkgver}.tar.bz2)
md5sums=('3e310418e4ea8ba9f0bdb240f82feb27')

build() {
  cd ${startdir}/src/${pkgname}+-${pkgver}
  python setup.py install --root=${startdir}/pkg
  cd trayicon
  python autogen.py
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
