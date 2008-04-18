# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Sebastian Sariego B. <seba@craftlink.org>

pkgname=apolos
pkgver=0.1.9rc1
origver=0.1.9-rc1
pkgrel=3
arch=(i686)
license=('GPL')
pkgdesc="Small CD Player for GNU/Linux"
url="http://www.nongnu.org/apolos/"
depends=('gtk2>=2.10.11' 'cdparanoia' 'libvorbis')
source=(http://savannah.nongnu.org/download/apolos/${pkgname}-$origver.tar.bz2)
md5sums=('220b5bff017ba5bb78b123d01e58750a')

build() {
  cd ${startdir}/src/${pkgname}-$origver
  echo "#/bin/sh" > mkinstalldirs
  echo "mkdir -p \$1" >> mkinstalldirs
  chmod a+rwx mkinstalldirs
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=${startdir}/pkg install
  sed -i 's|Type=Aplication|Type=Application|g' ${startdir}/pkg/usr/share/applications/apolos.desktop
}
