# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=xfce4-power-manager
pkgver=4.18.0
pkgrel=1
pkgdesc="Power Manager for Xfce"
arch=('x86_64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-panel')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('2eee467886252f9fa704c978ec67dafad5274ede93e59b092a688faa7e72c39a')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
