# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=cdrdao
pkgver=1.2.2
pkgrel=2
pkgdesc="Records audio/data CD-Rs in disk-at-once (DAO) mode"
arch=(i686 x86_64)
license=('GPL')
url="http://cdrdao.sourceforge.net/"
depends=('gcc-libs' 'lame' 'libmad' 'libvorbis' 'libao')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f0cbf36907406cb4f4c568f9e6669a34')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-lame
  make || return 1
  make DESTDIR=$startdir/pkg install
}
