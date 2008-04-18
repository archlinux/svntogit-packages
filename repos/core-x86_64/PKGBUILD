# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=libpcap
pkgver=0.9.8
pkgrel=2
pkgdesc="A system-independent interface for user-level packet capture"
arch=(i686 x86_64)
url="http://www.tcpdump.org/"
license=('BSD')
groups=('base')
depends=('glibc')
makedepends=('flex')
source=(http://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz
        libpcap-shared.patch)
md5sums=('5208f24d0328ee7c20b52c43eaa9aa0e'
         'b8a9c5e5cea0b89a8a7456c6c4d59db4')

# This package has a strict SONAME that changes in EVERY MINOR
# release. Whenever you feel like updating this package, DON'T,
# it will break a number of essential system tools.
# Again, for dummies: IF YOU UPDATE THIS PACKAGE DIRECTLY TO CORE,
# I WILL PERSONALLY CHOP YOUR HEAD OFF!

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/libpcap-shared.patch || return 1
  sed -i -e "s/@MAJOR@/`awk -F '.' '{ print $1 }' VERSION`/" \
         -e "s/@MINOR@/`awk -F '.' '{ print $2 }' VERSION`/" \
	 -e "s/@SUBMINOR@/`awk -F '.' '{ print $3 }' VERSION`/" \
	 -e "s/@VERSION@/`cat VERSION`/" Makefile.in
  
  ./configure --prefix=/usr --enable-ipv6
  DEFS="-g -D_U_=\"\" -fPIC -DHAVE_CONFIG_H -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE" 
  make -j1 DEFS="${DEFS}" || return 1
  make DESTDIR=${startdir}/pkg install
#  # backwards compatibility, programs often look for net/bpf.h
  mkdir -p ${startdir}/pkg/usr/include/net
  cd ${startdir}/pkg/usr/include/net
  ln -s ../pcap-bpf.h bpf.h

  #install the license
  install -D -m644 $startdir/src/$pkgname-$pkgver/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
