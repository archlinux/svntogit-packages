# Maintainer: damir <damir@archlinux.org>

pkgname=ladspa
pkgver=1.13
pkgrel=7
pkgdesc="Linux Audio Developer's Simple Plugin API (LADSPA)"
arch=('x86_64')
license=('LGPL')
url="http://www.ladspa.org/"
depends=('gcc-libs')
source=("https://github.com/OpenMandrivaAssociation/ladspa/raw/master/${pkgname}_sdk_${pkgver}.tgz"
        'fix-memleak-in-plugin-scanning.patch'
        'fallback-ladspa-path.patch')
md5sums=('671be3e1021d0722cadc7fb27054628e'
         '478c400e04c9db9cfd6ee1198beec9c5'
         '8a0ad7d442662af160381e7302c6ed4c')

build() {
  cd "${srcdir}/${pkgname}_sdk/src"
  patch -Np1 -i "${srcdir}/fix-memleak-in-plugin-scanning.patch"
  patch -Np2 -i "${srcdir}/fallback-ladspa-path.patch"
  sed \
    -e 's/mkdirhier/mkdir -p/' \
    -e "s#-O3#${CFLAGS} ${LDFLAGS/,--as-needed/}#" \
    -i makefile
  make targets
}

package() {
  cd "${srcdir}/${pkgname}_sdk/src"
  make INSTALL_PLUGINS_DIR="${pkgdir}/usr/lib/ladspa/" \
       INSTALL_INCLUDE_DIR="${pkgdir}/usr/include/" \
       INSTALL_BINARY_DIR="${pkgdir}/usr/bin/" install
}
