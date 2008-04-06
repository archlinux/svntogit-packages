# $Id: PKGBUILD,v 1.19 2007/12/10 18:29:10 varun Exp $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libbeagle
pkgver=0.3.0
pkgrel=3
pkgdesc="Beagle desktop search client library"
arch=(i686 x86_64)
url="http://www.gnome.org/projects/beagle/"
license=('custom')
depends=('glib2>=2.14.2' 'libxml2>=2.6.30')
makedepends=('gtk-sharp-2' 'pkgconfig' 'pygtk' 'sqlite3' 'gmime' 'perlxml' 'zip')
options=('!libtool')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.3/$pkgname-$pkgver.tar.bz2)
md5sums=('af21c1e0c704890506893408a569e9a1')

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
