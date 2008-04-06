pkgname=fastjar
pkgver=0.95
pkgrel=1
pkgdesc="Sun java jar compatible archiver"
arch=(i686 x86_64)
url="http://savannah.nongnu.org/projects/fastjar"
license=(GPL)
depends=('zlib')
source=(http://download.savannah.nongnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('92a70f9e56223b653bce0f58f90cf950')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1 || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
