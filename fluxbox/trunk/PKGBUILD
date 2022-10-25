# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=fluxbox
_commit='9d8202f32338a3f08d3fa39057dc5eec5d97be4e'
pkgver=1.3.7+211+g9d8202f3
pkgrel=1
pkgdesc='A lightweight and highly-configurable window manager'
arch=('x86_64')
url='http://www.fluxbox.org/'
license=('MIT')
depends=('fontconfig' 'libfontconfig.so' 'fribidi' 'libfribidi.so' 'imlib2'
         'libxft' 'libxinerama' 'libxpm' 'libxrandr')
makedepends=('git')
optdepends=('xorg-xmessage: for using the fbsetbg and fluxbox-generate_menu utilities')
options=('!makeflags')
source=("git+https://github.com/fluxbox/fluxbox.git#commit=${_commit}"
        'fluxbox.desktop')
sha256sums=('SKIP'
            '2148a90aca653b596e9632264dbdbd8c7e673d732e4b04eee66a8ac1e68b3c5d')

pkgver() {
  cd "${pkgname}"

  git describe --tags | sed 's/Release-//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${pkgname}"

  autoreconf -fi
}

build() {
  cd "${pkgname}"

  ./configure \
    --prefix=/usr \
    --enable-imlib2 \
    --enable-nls \
    --enable-xft \
    --enable-xinerama
  make
}

package() {
  cd "${pkgname}"

  make DESTDIR="${pkgdir}" install

  install -D -m0644 "${srcdir}/fluxbox.desktop" "${pkgdir}/usr/share/xsessions/fluxbox.desktop"
  install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
