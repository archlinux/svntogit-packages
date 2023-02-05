# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=xkeyboard-config
pkgver=2.38
pkgrel=1
pkgdesc="X keyboard configuration files"
arch=(any)
license=('custom')
url="https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config"
makedepends=('xorg-xkbcomp' 'libxslt' 'python' 'meson' 'git')
provides=('xkbdata')
replaces=('xkbdata')
conflicts=('xkbdata')
# https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config
source=(https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.xz{,.sig})
validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145') # Sergey Udaltsov <sergey.udaltsov@gmail.com> 
sha256sums=('0690a91bab86b18868f3eee6d41e9ec4ce6894f655443d490a2184bfac56c872'
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
