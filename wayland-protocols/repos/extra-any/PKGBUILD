# Maintainer: Sébastien Luttringer <seblu@seblu.net>

pkgname=wayland-protocols
pkgver=1.18
pkgrel=1
pkgdesc='Specifications of extended Wayland protocols'
arch=('any')
url='https://wayland.freedesktop.org/'
license=('MIT')
makedepends=('wayland')
validpgpkeys=('8307C0A224BABDA1BABD0EB9A6EEEC9E0136164A'  # Jonas Ådahl
              'A66D805F7C9329B4C5D82767CCC4F07FAC641EFF') # Daniel Stone
source=("https://wayland.freedesktop.org/releases/$pkgname-$pkgver.tar.xz"{,.sig})
sha1sums=('aa2f132c082f3c790bd046283b3ef7ce3fb11370'
          'SKIP')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver

  make check
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m 644 COPYING
}

# vim:set ts=2 sw=2 et:
