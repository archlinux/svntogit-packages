# $Id$
# Contributor: Essien Ita Essien <essiene@datavibe.net>
# Maintainer: damir <damir@archlinux.org>

pkgname=libnids
pkgver=1.22
pkgrel=2
pkgdesc="An implementation of an E-component of Network Intrusion Detection System."
arch=(i686 x86_64)
url="http://libnids.sourceforge.net/"
source=(http://belnet.dl.sourceforge.net/sourceforge/libnids/$pkgname-$pkgver.tar.gz)
depends=('libnet' 'libpcap>=0.9.8')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make install_prefix=$startdir/pkg install
}
md5sums=('811b31c7a1c4c96442807913b5eb1c95')
