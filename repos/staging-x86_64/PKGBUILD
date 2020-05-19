# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=libxfce4ui
pkgver=4.14.1
pkgrel=3
pkgdesc="Commonly used Xfce widgets among Xfce applications"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk2' 'gtk3' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada9b770325bed87f2da')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
