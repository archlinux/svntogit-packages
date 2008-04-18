# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=hspell
pkgver=1.0
pkgrel=1
pkgdesc="Hebrew spell-checker"
arch=(i686 x86_64)
url="http://www.ivrix.org.il/projects/spell-checker/"
depends=('glibc' 'zlib' 'perl')
options=('nolibtool')
source=(http://www.ivrix.org.il/projects/spell-checker/${pkgname}-${pkgver}.tar.gz)
md5sums=('3e12fa383c2cfd430918d115f33f9841')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver} 
  sed -i -e 's|/usr/bin/awk|/bin/awk|' wzip
  ./configure --prefix=/usr  --enable-linginfo
  make || return 1
  make DESTDIR=${startdir}/pkg/ install 
}
