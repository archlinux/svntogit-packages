# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=libsndfile
pkgver=1.0.28
pkgrel=2
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL')
depends=('alsa-lib' 'flac' 'libvorbis')
source=(http://www.mega-nerd.com/libsndfile/files/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9'
            'SKIP')
validpgpkeys=('73571E85C19F4281D8C97AA86CA41A7743B8D6C8'
              '6A91A5CF22C24C99A35E013FCFDCF91FB242ACED')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-sqlite
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
