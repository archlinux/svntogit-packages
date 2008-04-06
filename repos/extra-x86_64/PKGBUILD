# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>
pkgname=hunspell
pkgver=1.2.1
pkgrel=2
pkgdesc="Hunspell is a spell checker and morphological analyzer library"
arch=(i686 x86_64)
license=('GPL' 'LGPL' 'MPL')
url="http://hunspell.sourceforge.net/"
depends=('gcc')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/hunspell/${pkgname}-${pkgver}.tar.gz)
md5sums=('c504f9c2065f697e586593992dd74dae')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  [ "$CARCH" = "x86_64" ] && CXXFLAGS="${CXXFLAGS} -fPIC"
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  # hack to make it usable for OpenOffice
  sed -i "s/-1.2//" $startdir/pkg/usr/lib/pkgconfig/hunspell.pc
}
