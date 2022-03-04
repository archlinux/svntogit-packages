# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-diskperf-plugin
pkgver=2.7.0
pkgrel=1
pkgdesc="Displays instant disk/partition performance in the Xfce4 panel"
arch=('x86_64')
license=('BSD')
url="https://docs.xfce.org/panel-plugins/xfce4-diskperf-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('intltool')
source=(https://archive.xfce.org/src/panel-plugins/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('5909a65341a6af4d7ff3c7bb87aeac91c763f69b43ae9dc4a10668ac226fecc9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
