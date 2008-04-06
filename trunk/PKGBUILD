# $Id: PKGBUILD,v 1.6 2008/03/10 02:28:33 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=mpg123
pkgver=1.3.1
pkgrel=2
pkgdesc="A console based real time MPEG Audio Player for Layer 1, 2 and 3"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mpg123"
license=('GPL2' 'LGPL2')
depends=('glibc' 'libtool>=2.2' 'alsa-lib')
makedepends=('esd' 'sdl')
optdepends=('esd: for additional audio support' 'sdl: for additional audio support')
conflicts=('mpg321')
provides=('mpg321')
replaces=('mpg321')
options=('libtool')
source=(http://downloads.sourceforge.net/sourceforge/mpg123/mpg123-$pkgver.tar.bz2)
md5sums=('7c55a9f7cfe7358648570335c0325bed')
sha1sums=('76d7392b1874823b227b1e9c5fd486de33a8637f')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --with-audio="alsa esd sdl"
  make || return 1
  make DESTDIR=$startdir/pkg install
}
