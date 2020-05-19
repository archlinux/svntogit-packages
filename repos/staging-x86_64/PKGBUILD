# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lzop
pkgver=1.04
pkgrel=3
pkgdesc='File compressor using lzo lib'
url='https://www.lzop.org/'
arch=('x86_64')
license=('GPL')
depends=('lzo')
source=(https://www.lzop.org/download/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5829b4495ffefab549aa697a05c536ce593c572c9eee6004460583a0090abcd317c6074c4f981dfee6be61ac8d127f02dd37053b6cb782af64db41586a8bbb6e')

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
