# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tobias Kieslich <tobias@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libvorbis
pkgver=1.3.7
pkgrel=3
pkgdesc='Reference implementation of the Ogg Vorbis audio format'
arch=(x86_64)
url=https://www.xiph.org/vorbis/
license=(BSD)
depends=(libogg.so)
makedepends=(git)
provides=(
  libvorbis.so
  libvorbisenc.so
  libvorbisfile.so
)
_tag=0c55fa38933fd4bdb7db7c298b27e7bf2f2c5e98
source=(git+https://github.com/xiph/vorbis.git?signed#tag=${_tag})
validpgpkeys=(B7B00AEE1F960EEA0FED66FB9259A8F2D2D44C84) # Ralph Giles <giles@thaumas.net>
sha256sums=(SKIP)

pkgver() {
  cd vorbis

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd vorbis

  ./autogen.sh
}

build() {
  cd vorbis

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared
  make
}

check() {
  make -C vorbis check
}

package() {
  make DESTDIR="${pkgdir}" -C vorbis install
  install -Dm 644 vorbis/COPYING -t "${pkgdir}"/usr/share/licenses/libvorbis
}

# vim: ts=2 sw=2 et:
