# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=acl
pkgver=2.3.1
pkgrel=2
pkgdesc='Access control list utilities, libraries and headers'
arch=('x86_64')
url='https://savannah.nongnu.org/projects/acl'
license=('LGPL')
depends=('attr' 'libattr.so')
replaces=('xfsacl')
provides=('xfsacl' 'libacl.so')
conflicts=('xfsacl')
validpgpkeys=('600CD204FBCEA418BD2CA74F154343260542DF34'  # Brandon Philips <brandon@ifup.co>
              'B902B5271325F892AC251AD441633B9FE837F581'  # Frysinger <vapier@gentoo.org>
              '259B3792B3D6D319212CC4DCD5BF9FEB0313653A') # Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
source=("https://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('760c61c68901b37fdd5eefeeaf4c0c7a26bdfdd8ac747a1edff1ce0e243c11af'
            'SKIP')

build() {
  cd $pkgname-$pkgver

  ./configure \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
