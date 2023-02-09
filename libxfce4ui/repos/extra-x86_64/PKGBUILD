# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=libxfce4ui
pkgver=4.18.2
pkgrel=1
pkgdesc="Widgets library for the Xfce desktop environment"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification'
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=(https://archive.xfce.org/src/xfce/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2)
sha256sums=('ad602d0427e6c40c3eb53db393c607151a039aec58f1f197712c169c5fe49407')

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
