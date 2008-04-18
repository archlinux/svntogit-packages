# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: dorphell <dorphell@gmx.net>
pkgname=unrar
pkgver=3.7.8
pkgrel=1
pkgdesc="The RAR uncompression program"
arch=(i686 x86_64)
depends=('gcc-libs')
url="http://rarlab.com/"
license=('custom')
replaces=('rar')
source=(http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz
	unrar-3.5.2-optimalization-fix.patch)
md5sums=('b783f1932bc0c73902c6399f7c2c6f43'
         '30a0d1ef33fdc5f4dfffb458a9695630')

build() {
  cd ${startdir}/src/${pkgname}
  patch -Np1 -i ${startdir}/src/unrar-3.5.2-optimalization-fix.patch  || return 1
  make -f makefile.unix
  mkdir -p ${startdir}/pkg/usr/bin
  mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname
  install -m755 unrar ${startdir}/pkg/usr/bin/
  # install license
  install -m644 license.txt ${startdir}/pkg/usr/share/licenses/$pkgname/
}
