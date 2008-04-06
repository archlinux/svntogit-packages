# $Id: PKGBUILD,v 1.18 2008/02/28 20:58:29 thomas Exp $
# Maintainer: Thomas Baechler <thomas@archlinux.org>

pkgname=wireshark
pkgver=0.99.8
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux and Windows"
arch=(i686 x86_64)
depends=('gtk2' 'heimdal>=1.0.1' 'pcre' 'libpcap>=0.9.8'
         'bash' 'gnutls' 'libcap')
source=(http://www.wireshark.org/download/src/$pkgname-$pkgver.tar.gz)
url="http://www.wireshark.org/"
replaces=('ethereal')
md5sums=('417305db903357c7567b789c86283986')
options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
#  ln -s ../Makefile.common gtk/
  export CFLAGS="-fno-unit-at-a-time $CFLAGS"
  ./configure --prefix=/usr --enable-pcap --enable-zlib --enable-tethereal \
    --enable-editcap --enable-mergecap --enable-text2cap --enable-gtk2 --with-ssl \
    --without-net-snmp --without-ucd-snmp
  make all || return 1
  make DESTDIR=$startdir/pkg install
}
