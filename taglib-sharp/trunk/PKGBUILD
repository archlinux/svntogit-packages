# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Carlos Ruiz <cailovirtual@gmail.com>

pkgname=taglib-sharp
pkgver=2.0.3.0
pkgrel=2
pkgdesc="Free and Open Source library for the .NET 2.0 and Mono frameworks which will let you tag your software with as much or as little detail as you like without slowing you down."
url="http://www.taglib-sharp.com/Main_Page"
license=('LGPL2')
arch=('i686' 'x86_64')
depends=('mono>=1.9')
source=(http://www.taglib-sharp.com/Download/${pkgname}-${pkgver}.tar.gz)
md5sums=('aa2c344760c8f4d878957fd4600155a5')

build() {
  export MONO_SHARED_DIR="${startdir}/src/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-docs || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
