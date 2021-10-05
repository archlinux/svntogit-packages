# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.34
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('xorg-xkbcomp' 'libxslt' 'python' 'meson')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.bz2{,.sig})
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145')
validpgpkeys+=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha512sums=('cf3bdb658349b2db9db44ea1a0f7060b890b95520319101d83ba5aefeb0b1e2fd578b6f72a90758438f04bffbe7536cf112b76297fd47c95e02029fd203c51fb'
            'SKIP')

build() {
  arch-meson ${pkgname}-${pkgver} build \
	-D xkb-base="/usr/share/X11/xkb" \
	-D compat-rules=true \
	-D xorg-rules-symlinks=true

  # Print config
  meson configure build

  ninja -C build

 }
 
 package() { 

  DESTDIR="$pkgdir" ninja -C build install

  install -m755 -d "${pkgdir}/var/lib/xkb"
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
