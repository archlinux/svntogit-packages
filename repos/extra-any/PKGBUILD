# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-75dpi
pkgver=1.0.4
pkgrel=1
pkgdesc="X.org 75dpi fonts"
arch=(any)
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-fonts-alias-75dpi')
makedepends=('xorg-util-macros' 'xorg-mkfontscale' 'xorg-bdftopcf' 'xorg-font-util')
groups=('xorg')
source=(${url}/releases/individual/font/font-adobe-75dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-adobe-utopia-75dpi-1.0.5.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bh-75dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bh-lucidatypewriter-75dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bitstream-75dpi-1.0.4.tar.xz{,.sig})
sha512sums=('4e63c268525f21c03525870129c8d42cbd17a03d86d9c88bebdccb5094a1093acef1d2b6d4dde221559cb19f047b86baf58fa8ad65d28d4cb6c3064ec164836a'
            'SKIP'
            '9608698288fca47bf61cff911b8f081593807eed9f138ea22f05a7b6c26c481ec5144d79665cf509ba889df35ef5406e0de71710362bcf6de6b602c12158e22a'
            'SKIP'
            '8ccc5accdd43b4e1b8007c94e7916c6ee947ff0d57e3b0ce92154b718ef0ac2579659719738a50ef3ab0998a8bcea5b055e6a2e4d72b9fa5755b786143303955'
            'SKIP'
            'bfe2776b84533dd23648df42b2c74fb7f49e665e4f2128c6af529425a1569051c9ddadb696dfa7a6bd959a4929f8a75f7e4fbd7da7767d272a0a8a5424a879cf'
            'SKIP'
            'd678c58493696b3a744878991838b329243e5ba7985b1a435b62e9b1a05b5609d0b66d5943d840479ce2c5fc1da1b0633c33f28e3613712d26802fc41ee22c22'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd "${srcdir}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      ./configure --prefix=/usr \
          --with-fontdir=/usr/share/fonts/75dpi
      make
      popd
    fi
  done
}

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for dir in *; do
    if [ -d "${dir}" ]; then
      pushd "${dir}"
      make DESTDIR="${pkgdir}" install
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-75dpi-*}"
      popd
    fi
  done
  rm -f "${pkgdir}"/usr/share/fonts/75dpi/fonts.*
}
