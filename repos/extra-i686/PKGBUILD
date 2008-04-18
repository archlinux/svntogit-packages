# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=guile
pkgver=1.8.4
pkgrel=2
pkgdesc="Guile is a portable, embeddable Scheme implementation written in C"
url="http://www.gnu.org/software/guile/"
arch=(i686 x86_64)
license=('GPL')
depends=('gmp' 'libtool')
source=(ftp://ftp.gnu.org/pub/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz
        libtool-2.2.patch)
md5sums=('aacc6a384af88a85574717a9221f5c6e' '4edd52a08853236e9bad5439d1d79bcf')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../libtool-2.2.patch || return 1
  ./configure --prefix=/usr --disable-networking \
    --disable-error-on-warning
  make LDFLAGS+="-lpthread" || return 1
  make DESTDIR=${startdir}/pkg install
}
