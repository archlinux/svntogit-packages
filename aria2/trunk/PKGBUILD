# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>

pkgname=aria2
pkgver=0.13.1+2
pkgrel=1
pkgdesc="aria2 is a download utility with resuming and segmented downloading. Supports HTTP/HTTPS/FTP/BitTorrent/Metalink."
arch=(i686 x86_64)
url="http://aria2.sourceforge.net/"
license=('GPL')
depends=('gnutls' 'gcc-libs' 'libxml2>=2.6.30')
makedepends=('c-ares')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}c-$pkgver.tar.bz2)

build() {
  cd $startdir/src/${pkgname}c-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('5bcce06e9bc88fab9f5c4033148ec779')
sha1sums=('b3fc62b842a54fb3e0d8d7e923fc069d55c1fec0')
