# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.23.1
pkgrel=3
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig}
        0001-Fix-typo-in-Polish-symbols-file.patch
        0002_map_rfkill_wwan_to_xf86.diff)
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('d651bb89c265e58abe8bba4af6683364a8023cb73af7d00f401f33960e44fa94a7d8a8fdd2483d6703d1c261ca72ae5f2b53f543cfb70b2f571cfe9dcb80c3ba'
            'SKIP'
            '2c9a846a0eae6f208cd6be5aa92d69b0b7d1ffc2fe0f98af22f3b62cd73105ff63862d9a2b5719d6b0c5c035b7839faf4e88da5e0c6a336663afede41802381c'
            '1a0538f9ab4ba9c15d6f697a1ecc023acffa1eec30cd90182006087802d2bceb1d44bcbd7113654ed72da300ab636726ce2a7858c03a1bdedf6f4f8bd670d94f')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p1 -i "${srcdir}/0001-Fix-typo-in-Polish-symbols-file.patch"
  # FS#58261, https://bugs.freedesktop.org/show_bug.cgi?id=100970
  patch -p1 -i "${srcdir}/0002_map_rfkill_wwan_to_xf86.diff"
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
