# Maintainer: AndyRTR <andyrtr@archlinux.org>

# When releasing a xorgproto version with updated keysyms, rebuild libx11

pkgname=xorgproto
pkgver=2019.2
pkgrel=2
pkgdesc="combined X.Org X11 Protocol headers"
arch=('any')
url="https://xorg.freedesktop.org/"
license=('custom')
makedepends=('xorg-util-macros' 'meson')
source=(https://xorg.freedesktop.org/archive/individual/proto/$pkgname-$pkgver.tar.bz2{,.sig})
sha512sums=('cbfdf6bb3d58d4d4e7788c9ed779402352715e9899f65594fbc527b3178f1dc5e03cebc8ba5a863b3c196a1a0f2026c2d0438207ca19f81f3c8b7da0c0667904'
            'SKIP')
validpgpkeys=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') #  "Adam Jackson <ajax@nwnk.net>"
validpgpkeys+=('DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3') # "Adam Jackson <ajax@benzedrine.nwnk.net>"
validpgpkeys+=('C383B778255613DFDB409D91DB221A6900000011') #  "Keith Packard <keithp@keithp.com>"
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # "Peter Hutterer (Who-T) <office@who-t.net>"
validpgpkeys=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # Adam Jackson <ajax@redhat.com>

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
  install -m644 "$pkgname"-$pkgver/*.txt "${pkgdir}/usr/share/doc/${pkgname}/"
  install -m644 "$pkgname"-$pkgver/PM_spec "${pkgdir}/usr/share/doc/${pkgname}/"
  rm "${pkgdir}"/usr/share/doc/${pkgname}/meson_options.txt

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
