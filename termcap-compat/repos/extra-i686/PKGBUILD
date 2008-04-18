# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=termcap-compat
pkgver=1.2.3
pkgrel=4
pkgdesc="Compatibility package for old termcap-based programs."
arch=(i686 x86_64)
source=(http://ftp.debian.org/debian/pool/main/t/termcap-compat/termcap-compat_1.2.3.tar.gz
	bcopy_fix.patch)
depends=('ncurses')
replaces=('termcap')
url="http://packages.debian.org/unstable/oldlibs/termcap-compat"
md5sums=('698f1e510845b8c0f15ea8c3010c35ed'
         'c5389fda988845f0c56af4ec72c8d524')

build() {
  cd ${startdir}/src/${pkgname}-$pkgver
  patch -Np0 -i ${startdir}/src/bcopy_fix.patch
  make || return 1
  mkdir -p ${startdir}/pkg/usr/lib
  install -m755 libtermcap.so.2.* ${startdir}/pkg/usr/lib/
  ln -sf libtermcap.so.2.* ${startdir}/pkg/usr/lib/libtermcap.so.2
  ln -sf libtermcap.so.2.* ${startdir}/pkg/usr/lib/libtermcap.so
}
