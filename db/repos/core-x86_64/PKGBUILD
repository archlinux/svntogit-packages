# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=db
pkgver=4.6.21
pkgrel=2
pkgdesc="The Berkeley DB embedded database system"
arch=(i686 x86_64)
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
groups=('base')
depends=('gcc-libs' 'coreutils')
options=('!libtool')
source=(http://download-uk.oracle.com/berkeley-db/db-$pkgver.tar.gz)
install=(db.install)
md5sums=('718082e7e35fc48478a2334b0bc4cd11')

build() {
  cd $startdir/src/$pkgname-$pkgver/build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --enable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
  make DESTDIR=$startdir/pkg install
  rm -rf $startdir/pkg/usr/docs
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
