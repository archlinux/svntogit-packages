# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu
# Contributor: Elis Hughes <elishughes@googlemail.com>

pkgname=rtmpdump
pkgver=2.4.r99.f1b83c1
pkgrel=2
epoch=1
pkgdesc='A toolkit for RTMP streams'
arch=(x86_64)
url=https://rtmpdump.mplayerhq.hu/
license=(
  GPL2
  LGPL2.1
)
depends=(
  glibc
  gnutls
  zlib
)
makedepends=(git)
provides=(librtmp.so)
#options=('!makeflags')
_commit=f1b83c10d8beb43fcc70a6e88cf4325499f25857
source=(git+https://git.ffmpeg.org/rtmpdump#commit=${_commit})
sha256sums=(SKIP)

pkgver() {
  cd rtmpdump
  echo "2.4.r$(git rev-list --count c28f1bab7822de97353849e7787b59e50bbb1428..HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd rtmpdump
  sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile
  make \
    OPT="$CFLAGS" \
    XLDFLAGS="$LDFLAGS"
}

package() {
  cd rtmpdump
  make \
    prefix=/usr \
    sbindir=/usr/bin \
    mandir=/usr/share/man \
    DESTDIR="${pkgdir}" \
    install
}

# vim: ts=2 sw=2 et:
