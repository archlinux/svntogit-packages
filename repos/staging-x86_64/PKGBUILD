# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libmypaint
pkgver=1.6.1
pkgrel=1
pkgdesc='Library for making brushstrokes which is used by MyPaint and other projects'
url='http://mypaint.org/'
arch=('x86_64')
license=('ISC')
depends=('glibc' 'json-c' 'gegl' 'glib2' 'json-glib' 'babl')
makedepends=('intltool' 'python' 'python-sphinx' 'python-breathe' 'gobject-introspection' 'doxygen')
source=(https://github.com/mypaint/libmypaint/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz
        libmypaint-autoconf-2.7.patch::https://github.com/mypaint/libmypaint/commit/a6bac154db018e1f1cc4dbddc34f6c8422c891fb.patch)
sha512sums=('f759223e2e2da9fcc675bc2fa6324e2688ab36bdd979c0b3fad6737a6884e6095b6599c37960fd4897b9fd9063d5643fc2ab7e559438095c1872e019cd46d38b'
            'a3ed4de701c24fa2fe1bdd50c0f2993f35c238e0145b514b2eee60cd35c4928f5aa552d761326ac9722da485a034421d1b3222c13d79e82812f78755a96158b4')
b2sums=('08e88b83391a237f89f8eb601421f822f74e2e02607ebe7e28c52b5bc6060b39102ded44ff530016bfd4fb4882006dbbeac71964b9962645e1b9068f8efe5f55'
        '0086daed928fa300e5c64049ac1779cb77c74727ad0a7baebd6bd6bfc6326207d3a434b401f1b0ce10aeec00e103e493e273c346a05b0c6f5da76db9ccea6c16')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 < ../libmypaint-autoconf-2.7.patch
  ./autogen.sh
  autoreconf -fiv
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --enable-gegl \
    --enable-docs
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
