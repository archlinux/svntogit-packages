# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>
# Contributor: Michel Brabants <michel.brabants@euphonynet.be>

pkgname=libzrtpcpp
pkgver=0.9.0
pkgrel=3
pkgdesc="ZRTP is an extension to Real-time Transport Protocol (RTP) which describes a method of Diffie-Hellman key agreement for Secure Real-time Transport Protocol (SRTP)."
arch=('i686' 'x86_64')
url="http://zfoneproject.com"
license=('GPL')
depends=('ccrtp>=1.5.1')
makedepends=('pkgconfig')
options=(!libtool)
source=(ftp://ftp.gnu.org/gnu/ccrtp/$pkgname-$pkgver.tar.gz)
md5sums=('a439328318f25e3069549e265902a119')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
