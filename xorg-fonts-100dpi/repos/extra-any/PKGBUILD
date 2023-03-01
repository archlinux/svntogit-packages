# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=xorg-fonts-100dpi
pkgver=1.0.4
pkgrel=2
pkgdesc="X.org 100dpi fonts"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('xorg-fonts-alias-100dpi')
makedepends=('xorg-util-macros' 'xorg-mkfontscale' 'xorg-bdftopcf' 'xorg-font-util')
groups=('xorg')
source=(${url}/releases/individual/font/font-adobe-100dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-adobe-utopia-100dpi-1.0.5.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bh-100dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bh-lucidatypewriter-100dpi-1.0.4.tar.xz{,.sig}
        ${url}/releases/individual/font/font-bitstream-100dpi-1.0.4.tar.xz{,.sig})
sha512sums=('fedb86672c3b9cb624ee5d74d1d710f21d92c2d48a1fcf0a45b54b3f992f6f5599fc271d38a7e25ef123b64d405fa60a3d46883fe7a9d71ebad83c9b418f8383'
            'SKIP'
            '9685d66de107ab3142aa9322bbded20f4f538d7bcd8c97bfb4db8eb1fc440724b0c7574ee8b4b5e96c81044c8ee4da175dd638f03dc3e1e650200fdf7b8a169b'
            'SKIP'
            '5fe2a24df0d0e9109f1c1cb2556f4cdbf07cc16441e565333f01a00815dd4555b6ef0dd689ef3196ddb76db7480bca8f0b501d4244262d6c64d4751d75503b44'
            'SKIP'
            '31a4d061430089c5523815dde7d7cf73c9cba768ab79004eb65af8a1684fdd57d0829d9f4249c8e542e733266cc5f83e38eff403423a77a06af15008ce95d2ab'
            'SKIP'
            '1389681eee8b9e2bbfe0293b0aa1add7c6fa86149ff3cb779195ddcc548b1a519336c2d43b6988c899dc09d44ca30de9ffb5daca24fc3906694ab0fd391eb437'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

build() {
  cd "${srcdir}"
  for dir in font-*-100dpi*; do
    if [ -d "${dir}" ]; then
      pushd ${dir}
      ./configure --prefix=/usr \
          --with-fontdir=/usr/share/fonts/100dpi
      make
      popd
    fi
  done
}

package() {
  cd "${srcdir}"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  for dir in font-*-100dpi*; do
    if [ -d "${dir}" ]; then
      pushd ${dir}
      make DESTDIR="${pkgdir}" install
      install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.${dir%-100dpi-*}"
      popd
    fi
  done
  rm -f "${pkgdir}"/usr/share/fonts/100dpi/fonts.*
}
