# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=vice
pkgver=1.22
pkgrel=1
pkgdesc="A Versatile Commodore Emulator"
arch=(i686 x86_64)
license=('GPL')
url="http://www.viceteam.org/"
source=(ftp://ftp.zimmers.net/pub/cbm/crossplatform/emulators/VICE/$pkgname-$pkgver.tar.gz)
depends=('esd' 'gcc' 'libjpeg' 'libpng' 'libungif' 'libxaw' 'libxv'
    'libxxf86dga' 'libxxf86vm' 'readline')
md5sums=('33204acbb74bafb12594d39b55888626')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-fullscreen
  make || return 1
  make DESTDIR=$startdir/pkg install
}
