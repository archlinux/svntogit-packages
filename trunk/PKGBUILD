# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=libsndfile
pkgver=1.0.28
pkgrel=3
pkgdesc="A C library for reading and writing files containing sampled sound"
arch=('x86_64')
url="http://www.mega-nerd.com/libsndfile"
license=('LGPL2.1')
depends=('glibc' 'libFLAC.so' 'libogg' 'libvorbis.so' 'libvorbisenc.so')
makedepends=('alsa-lib')
optdepends=('alsa-lib: for sndfile-play')
provides=('libsndfile.so')
source=("http://www.mega-nerd.com/libsndfile/files/$pkgname-$pkgver.tar.gz"{,.asc})
sha512sums=('890731a6b8173f714155ce05eaf6d991b31632c8ab207fbae860968861a107552df26fcf85602df2e7f65502c7256c1b41735e1122485a3a07ddb580aa83b57f'
            'SKIP')
validpgpkeys=('6A91A5CF22C24C99A35E013FCFDCF91FB242ACED') # Erik de Castro Lopo <erikd@mega-nerd.com>

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-sqlite
  make
}

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
