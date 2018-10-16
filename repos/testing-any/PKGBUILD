# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.25
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://www.freedesktop.org/wiki/Software/XKeyboardConfig"
makedepends=('intltool' 'xorg-xkbcomp' 'libxslt')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig})
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('2d9d6bdd885edc8e03e5a2c136c3b29b4ea795122709fa210bf151c4e7416a44fa2928bb29137ee8c6691d8646c1f645748576dea3f940ce84c8d4d0f91e09eb'
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
