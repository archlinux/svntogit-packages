# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=file
pkgver=4.23
pkgrel=1
pkgdesc="File type identification utility"
arch=('i686' 'x86_64')
license=('custom')
groups=('base')
url="ftp://ftp.gw.com/mirrors/pub/unix/file/"
depends=('glibc' 'zlib')
options=('!libtool')
source=(ftp://ftp.astron.com/pub/$pkgname/$pkgname-$pkgver.tar.gz)
#source=(ftp://ftp.gw.com/mirrors/pub/unix/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('014a69979a8d5225a6ca2bcc4d7e967e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --datadir=/usr/share/misc
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 LEGAL.NOTICE ${startdir}/pkg/usr/share/licenses/${pkgname}/LEGAL.NOTICE
}
