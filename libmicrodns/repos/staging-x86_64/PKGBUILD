# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Niklas <dev@n1klas.net>

pkgname=libmicrodns
pkgver=0.2.0
pkgrel=1
pkgdesc='Minimal mDNS resolver library'
url='https://github.com/videolabs/libmicrodns'
arch=('x86_64')
license=('LGPL2.1')
depends=('glibc')
makedepends=('meson')
provides=('libmicrodns.so')
source=(https://github.com/videolabs/libmicrodns/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('6389ad9edaf1af7c831e8c05e4800964b13cf0eed2063fa3675e7b87c49428ae7b68ac4ed1e742ed5d46ea3ded190e3de076e73ebf167422505257d7b1a03e25')
b2sums=('d58cd4e91334187b4ffe54063586d24f02d705f183e41c5edd3220c7cae137294fa3728daaf66e3d43c9e4ee031e6b87e7b4c5e1852a36486cb5495d6680f70a')

build() {
  cd ${pkgname}-${pkgver}
  arch-meson build
  ninja -C build
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" meson install -C build
}

# vim: ts=2 sw=2 et:
