# Maintainer: damir <damir@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=ladspa
pkgver=1.15
pkgrel=2
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=('x86_64')
license=('LGPL')
url="https://www.ladspa.org/"
depends=('gcc-libs')
source=("https://ladspa.org/download/ladspa_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch')
sha512sums=('a521622e23d988284244003e4ccfc3b42f6ddc7944cb00e7949b87e09d7f39a0cbb64b6d8b5a5af0a5ccf7179f88815416a88f02d3912957167e54b74accfc65'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')

prepare() {
  mv -v ${pkgname}_sdk_${pkgver} ${pkgname}-${pkgver}
  cd "${pkgname}-${pkgver}"
  patch -Np0 -i "../fix-memleak-in-plugin-scanning.patch"
  # add LDFLAGS for full RELRO
  sed -e "s#-O2#${CFLAGS} ${LDFLAGS}#" -i src/Makefile
}

build() {
  cd "${pkgname}-${pkgver}/src"
  make targets
}

package() {
  cd "${pkgname}-${pkgver}/src"
  make INSTALL_PLUGINS_DIR="${pkgdir}/usr/lib/ladspa/" \
       INSTALL_INCLUDE_DIR="${pkgdir}/usr/include/" \
       INSTALL_BINARY_DIR="${pkgdir}/usr/bin/" install
  install -vDm 644 ../doc/*.{html,txt} -t "${pkgdir}/usr/share/doc/${pkgname}"
}

