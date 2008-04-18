# $Id$

# Maintainer: Travis Willard <travis@archlinux.org> 
# Contributor: Brad Gordon <brad@rpgcyco.net>

pkgname=libmowgli
pkgver=0.6.1
pkgrel=1
pkgdesc="Development framework for C"
arch=('i686' 'x86_64')
url="http://www.atheme.org/projects/mowgli.shtml"
license=('BSD')
depends=('glibc')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://distfiles.atheme.org/${pkgname}-${pkgver}.tgz)
md5sums=('80f8a27f1b44b0b129215f858ab1ab82')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -m644 -D ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}

