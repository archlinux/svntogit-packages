# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-eyes-plugin
pkgver=4.6.0
pkgrel=1
pkgdesc="A rolling eyes (following mouse pointer) plugin for the Xfce panel"
arch=('x86_64')
url="https://docs.xfce.org/panel-plugins/xfce4-eyes-plugin"
license=('GPL2')
groups=('xfce4-goodies')
depends=('xfce4-panel' 'hicolor-icon-theme')
makedepends=('intltool' 'perl-xml-parser')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('ad0ff05d88ba393b7c8922f8233edd33fc0a4e8b000b61de1f8f3a10c5ae5324')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
