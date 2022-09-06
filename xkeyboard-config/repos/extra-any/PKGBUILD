# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=xkeyboard-config
_commit=382c5feb04c151833a8d10de3198d1ace4d62c0b # = master 2022-09-05
pkgver=2.36+89+g382c5feb
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
source=(#https://xorg.freedesktop.org/archive/individual/data/${pkgname}/${pkgname}-${pkgver}.tar.xz{,.sig}
        "git+https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config.git#commit=$_commit")
#validpgpkeys=('FFB4CCD275AAA422F5F9808E0661D98FC933A145') # Sergey Udaltsov <sergey.udaltsov@gmail.com>
#validpgpkeys=('15CFA5C595041D2CCBEA155F1732AA424A0E86B4') # "Sergey Udaltsov (For GNOME-related tasks) <svu@gnome.org>"
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed "s/$pkgname//" | sed 's/^Release.//;s/\([^-]*-g\)/\1/;s/-/+/g;' | sed 's/+//'
}

build() {
#  arch-meson ${pkgname}-${pkgver} build \
  arch-meson ${pkgname} build \
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
  #install -m644 ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 ${pkgname}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
