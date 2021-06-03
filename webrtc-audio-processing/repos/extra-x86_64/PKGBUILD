# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=webrtc-audio-processing
pkgver=0.3.1
pkgrel=3
pkgdesc="AudioProcessing library based on Google's implementation of WebRTC"
url="https://freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
arch=(x86_64)
license=(custom)
depends=(gcc-libs)
makedepends=(git)
provides=(libwebrtc_audio_processing.so)
_commit=e882a5442ac22c93648e12837248d651d18b9247  # tags/v0.3.1^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/webrtc-audio-processing.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

# vim:set sw=2 et:
