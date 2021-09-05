# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=ladspa
pkgver=1.16
pkgrel=1
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=('x86_64')
license=('LGPL2.1')
url="https://www.ladspa.org/"
depends=('gcc-libs' 'glibc')
makedepends=('libsndfile')
optdepends=('libsndfile: for applyplugin')
source=("https://ladspa.org/download/ladspa_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch')
sha512sums=('861178f309d6c25a67841ea3097535f52fcd55f5d5fab897897c95e7cda8e973cf7c1ea7cc30fcfa29a320f2b5f13c2e6e3b42a7d1c55062b3c71abbb6239505'
            'e80a575e6afe42f9d0ac1234a7832a29fb9362c7ab7b2d6b14cc3e6da6a9ba67af886cf09f1c0b78c161205084f705049fb4dc22fe2795efaeb7d94da90dc93e')
b2sums=('42af7cca21891a667d84441b1f03ce1e250eda4555c6330f66566e633bb32002f72b4f2ef68a9638d761871932f212060e931025182c28147be02d780e15d32b'
        'b2235b41d9638cceb93a41452f1f0b710bc3f9264fe735972099244dfc8d98d354c7d15084d79b0bdfc4fa3f437f9368f81aa0ebdb7e39df5900fbbf172927c2')

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

