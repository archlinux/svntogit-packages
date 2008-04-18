# $Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=libbeagle
pkgver=0.3.5
pkgrel=1
pkgdesc="Beagle desktop search client library"
arch=(i686 x86_64)
url="http://www.gnome.org/projects/beagle/"
license=('custom')
depends=('glib2>=2.16.2' 'libxml2>=2.6.31')
makedepends=('gtk-sharp-2' 'pkgconfig' 'pygtk' 'sqlite3' 'gmime' 'perlxml' 'zip')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.3/$pkgname-$pkgver.tar.bz2)
md5sums=('50dcb652e37cfdede9c62d938cf85048')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-gui \
	      --disable-static
    make || return 1
    make DESTDIR=${startdir}/pkg install
   mkdir -p ${startdir}/pkg/usr/share/licenses/libbeagle
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                ${startdir}/pkg/usr/share/licenses/libbeagle
}
