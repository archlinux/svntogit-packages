# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gsf-sharp
pkgver=0.8.1
pkgrel=1
pkgdesc="libgsf .NET binding"
arch=(i686 x86_64)
url="http://go-mono.org/"
depends=('libgsf>=1.14.1' 'gtk-sharp-2>=2.10')
makedepends=('pkgconfig')
options=(NOLIBTOOL)
source=(http://primates.ximian.com/~joe/${pkgname}-${pkgver}.tar.gz)
md5sums=('92bb68612bdcd8ca3c475b3fee097968')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p ${MONO_SHARED_DIR}

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  rm -rf ${MONO_SHARED_DIR}
}

