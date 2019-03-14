# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfce4-power-manager
pkgver=1.6.1
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'hicolor-icon-theme')
optdepends=('xfce4-panel: for the Xfce panel plugin')
makedepends=('intltool' 'xfce4-panel')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('1ea825452343b895566068018b6d5078608f8f46ce8075ba6bbb4b848f48656b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
