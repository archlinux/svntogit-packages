# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.30
pkgrel=2
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
# https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt' 'python')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig}
        fix_symbols_syntax_error.diff)
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('2d775dcaab49d80f62b8eaadc9be406b42c9a3643d3a360f864a462c61865abce67d0a8a80772d54f8136603114c61b5168fd06771f9c132411911914abb1ea4'
            'SKIP'
            'b8463f877f671be5ebf5b1baf1f5c287a14f57de56cc67ea71c6094b40b501c12fbbab3d6cb79926aac80546919a74d0fb77a13ea1a58791a968ee1a1bbe25f6')

prepare() {
  cd ${pkgname}-${pkgver}
  # FS#66898 / https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/issues/212
  patch -Np1 -i ../fix_symbols_syntax_error.diff
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
      --with-xkb-base=/usr/share/X11/xkb \
      --with-xkb-rules-symlink=xorg \
      --enable-compat-rules=yes
  make
 }
 
 package() { 
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -f "${pkgdir}/usr/share/X11/xkb/compiled"

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
