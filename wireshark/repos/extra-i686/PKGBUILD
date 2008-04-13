# $Id: PKGBUILD,v 1.18 2008/02/28 20:58:29 thomas Exp $
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=wireshark
pkgver=1.0.0
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux and Windows"
arch=(i686 x86_64)
depends=('gtk2' 'heimdal>=1.0.1' 'pcre' 'libpcap>=0.9.8'
         'bash' 'gnutls' 'libcap')
source=(http://www.wireshark.org/download/src/$pkgname-$pkgver.tar.gz)
url="http://www.wireshark.org/"
replaces=('ethereal')
md5sums=('8c6328955437fd18f9b102a2ea099980')
options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
  export CFLAGS="-fno-unit-at-a-time $CFLAGS"
  ./configure --prefix=/usr --with-ssl
  make all || return 1
  make DESTDIR=$startdir/pkg install
}
