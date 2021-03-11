# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=acl
pkgver=2.3.0
pkgrel=1
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
sha256sums=('bd38fdbbb03c79374af51467ebe5497cbc0335b82577f30c951a41a95b533009'
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
