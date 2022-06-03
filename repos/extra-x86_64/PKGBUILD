# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Ju Liu <liuju86 at gmail dot com>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Andreas Zwinkau <beza1e1@web.de>

pkgname=telepathy-mission-control
pkgver=5.16.6
pkgrel=2
pkgdesc='A Telepathy component providing abstraction of some of the details of connection managers'
arch=(x86_64)
url='https://telepathy.freedesktop.org/'
license=(LGPL2.1)
depends=(telepathy-glib dconf libnm)
makedepends=(libxslt python gtk-doc)
source=(https://telepathy.freedesktop.org/releases/$pkgname/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('2df8ae3995e919a7670e01aa3568215ef0777e34961ace1cac1c6477cb297a45'
            'SKIP')
validpgpkeys=(38FDAD7D73CE1AE7A16200291F3845DD1432A9FB  # Georgios Kiagiadakis <gkiagia@tolabaki.gr>
              AA33B0D27868E36C151780F0FE0B6D736B1195ED) # Alexandr Akulich <akulichalexander@gmail.com>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/telepathy \
      --with-connectivity=nm \
      --enable-gtk-doc \
      --disable-upower \
      --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
