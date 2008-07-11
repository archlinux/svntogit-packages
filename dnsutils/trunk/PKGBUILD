# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: mario <mario_vazq@hotmail.com>
pkgname=dnsutils
pkgver=9.4.2
_pkgver=9.4.2
pkgrel=1
pkgdesc="Various DNS utilities - dig host nslookup nsupdate"
arch=(i686 x86_64)
url="http://www.isc.org/index.pl?/sw/bind/"
license=('custom:ISC')
depends=('openssl>=0.9.8e')
replaces=('bind-tools')
source=(ftp://ftp.isc.org/isc/bind9/${_pkgver}/bind-${_pkgver}.tar.gz
	bind.so_bsdcompat.diff tools-only.patch)
md5sums=('57953d7264139b9506b9d66174125179' '447d58721cfee0e1e377b46f7d50b327'
         '329f7e15b8c45d3efefdf5b559bb878a')
force=y

build() {
  export MAKEFLAGS="-j1"

  cd ${startdir}/src/bind-${_pkgver}
  patch -Np0 -i ${startdir}/src/bind.so_bsdcompat.diff || return 1
  patch -Np1 -i ${startdir}/src/tools-only.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --with-openssl=yes
  make || return 1
  cd bin
  make DESTDIR=${startdir}/pkg install || return 1
  install -D -m644 ../COPYRIGHT $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
