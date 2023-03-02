# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-fonts-alias
pkgname=('xorg-fonts-alias-100dpi' 'xorg-fonts-alias-75dpi' 'xorg-fonts-alias-cyrillic' 'xorg-fonts-alias-misc')
pkgver=1.0.5
pkgrel=1
arch=('any')
url="https://xorg.freedesktop.org/"
makedepends=('xorg-util-macros')
license=('custom')
source=(${url}/releases/individual/font/font-alias-${pkgver}.tar.xz{,.sig})
sha512sums=('86bffa6b9ff789eeba715c079965157806ed633d44cd3dbf5e2a4bba2b390a0f48db65edc8e3264acbc2368d78a8d7e05bc2e2e3a86ddbf6b08bfe7f5e862bcc'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd "${srcdir}/font-alias-${pkgver}"
  ./configure --prefix=/usr --with-fontrootdir=/usr/share/fonts
  make
}

package_xorg-fonts-alias-100dpi() {

  pkgdesc="X.org font alias files - 100dpi font familiy"
  conflicts=(xorg-fonts-alias)

  cd "${srcdir}/font-alias-${pkgver}"
  make -C 100dpi DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_xorg-fonts-alias-75dpi() {

  pkgdesc="X.org font alias files - 75dpi font familiy"
  conflicts=(xorg-fonts-alias)

  cd "${srcdir}/font-alias-${pkgver}"
  make -C 75dpi DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
package_xorg-fonts-alias-cyrillic() {

  pkgdesc="X.org font alias files - cyrillic font familiy"
  conflicts=(xorg-fonts-alias)

  cd "${srcdir}/font-alias-${pkgver}"
  make -C cyrillic DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
package_xorg-fonts-alias-misc() {

  pkgdesc="X.org font alias files - misc font familiy"
  conflicts=(xorg-fonts-alias)

  cd "${srcdir}/font-alias-${pkgver}"
  make -C misc DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
