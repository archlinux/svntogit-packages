# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.31
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
# https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt' 'python')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig})
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('f6f260253e1757640cc0591f9efb55ad5d08023a53ec2f0b468465b36bae0aae4f78dc4d6e603c95aa21c9993d9a42bd641edf2017be3183921a0b1c125f4669'
            'SKIP')

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
