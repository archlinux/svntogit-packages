# Maintainer: AndyRTR <andyrtr@archlinux.org>

# When releasing a xorgproto version with updated keysyms, rebuild libx11

pkgname=xorgproto
pkgver=2022.1
pkgrel=1
pkgdesc="combined X.Org X11 Protocol headers"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('xorg-util-macros' 'meson')
checkdepends=('python-libevdev')
source=(https://xorg.freedesktop.org/archive/individual/proto/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('add275a9c0d005053f31fdca6da009142792a3c7e2cd4b56da93eed3a397adf52d91c441ff6455959b87559f402eb9f46fdd8932e951c7d2d96623975391202a'
            'SKIP')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # "Peter Hutterer (Who-T) <office@who-t.net>"
#validpgpkeys=('FD0004A26EADFE43A4C3F249C6F7AE200374452D') # "Povilas Kanapickas <povilas@radix.lt>"

prepare() {
  mkdir build
}

build() {
  arch-meson "$pkgname"-$pkgver build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # missing docs
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "$pkgname"-$pkgver/PM_spec "${pkgdir}/usr/share/doc/${pkgname}/"

  # licenses
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "$pkgname"-$pkgver/COPYING* "${pkgdir}/usr/share/licenses/${pkgname}/"
  # remove licences of legacy stuff we don't ship anymore
  rm -f "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING-{evieproto,fontcacheproto,lg3dproto,printproto,xcalibrateproto,xf86rushproto}

  # cleanup
  rm -f "${pkgdir}"/usr/include/X11/extensions/apple*
  rm -f "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING-{apple,windows}wmproto
  rm -f "${pkgdir}"/usr/share/pkgconfig/applewmproto.pc
}
