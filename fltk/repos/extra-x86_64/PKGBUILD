# $Id$
# Maintainer: roberto <roberto@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Updated to produce shared libs: Andrew Rose <ody@netrux.com>

pkgname=fltk
pkgver=1.1.8
pkgrel=1
pkgdesc="Graphical user interface toolkit for X"
arch=(i686 x86_64)
license=('LGPL')
depends=('libjpeg' 'libpng' 'gcc-libs' 'libxft' 'libxext')
source=(http://ftp.easysw.com/pub/$pkgname/$pkgver/$pkgname-$pkgver-source.tar.bz2)
url="http://www.fltk.org/"
md5sums=('0f272d7299778e42fcbedf3c01741f4f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared
  make || return 1
  make DESTDIR=$startdir/pkg install
}
