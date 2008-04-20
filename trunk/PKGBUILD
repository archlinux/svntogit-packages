# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>
pkgname=hunspell
pkgver=1.2.2
pkgrel=1
pkgdesc="Hunspell is a spell checker and morphological analyzer library"
arch=(i686 x86_64)
license=('GPL' 'LGPL' 'MPL')
url="http://hunspell.sourceforge.net/"
depends=('gcc-libs')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/hunspell/${pkgname}-${pkgver}.tar.gz)
md5sums=('e8cde1130894dcd3f732248db945d0c0')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  [ "$CARCH" = "x86_64" ] && CXXFLAGS="${CXXFLAGS} -fPIC"
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # hack to make it usable for OpenOffice
  sed -i "s/-1.2//" $startdir/pkg/usr/lib/pkgconfig/hunspell.pc
}
