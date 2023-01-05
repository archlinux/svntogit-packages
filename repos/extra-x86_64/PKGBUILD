# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=libxfce4ui
pkgver=4.18.1
pkgrel=1
pkgdesc="Widgets library for the Xfce desktop environment"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification'
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('6ebf7b30021b7bce75824b4c6dc2571ffb3dcd6a74468e823a74719313e5e52e')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
