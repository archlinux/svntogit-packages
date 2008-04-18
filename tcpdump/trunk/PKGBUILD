# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=tcpdump
pkgver=3.9.8
pkgrel=1
pkgdesc="A tool for network monitoring and data acquisition"
arch=(i686 x86_64)
url="http://www.tcpdump.org/"
license=('BSD')
depends=('libpcap>=0.9.8' 'openssl')
source=(http://www.tcpdump.org/release/${pkgname}-${pkgver}.tar.gz)
md5sums=('c491a78c52fe73f1f7271aa5d8c6ab2e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  #install the license
  install -D -m644 LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
