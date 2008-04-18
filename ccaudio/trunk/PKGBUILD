# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: arjan <arjan@archlinux.org>
pkgname=ccaudio
pkgver=1.2.0
pkgrel=1
pkgdesc="GNU ccAudio"
arch=('i686' 'x86_64')
url="hhtp://www.gnu.org/software/ccaudio/"
license=('GPL')
depends=('commoncpp2' 'libxml2' 'zlib')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/gnutelephony/$pkgname-$pkgver.tar.gz)
md5sums=('919210cf0d917fbb7813d2cbf2c1e941')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
