# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=acl
pkgver=2.2.53
pkgrel=2
pkgdesc='Access control list utilities, libraries and headers'
arch=('x86_64')
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL')
depends=('attr')
replaces=('xfsacl')
provides=('xfsacl')
conflicts=('xfsacl')
validpgpkeys=('600CD204FBCEA418BD2CA74F154343260542DF34'  # Brandon Philips <brandon@ifup.co>
              'B902B5271325F892AC251AD441633B9FE837F581') # Frysinger <vapier@gentoo.org>
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('06be9865c6f418d851ff4494e12406568353b891ffe1f596b34693c387af26c7'
            'SKIP')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
