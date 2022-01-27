# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=noto-fonts-cjk
pkgver=20220126
_commit=473da44c32fec739db7e5458c81a833513cb4084
pkgrel=1
pkgdesc='Google Noto CJK fonts'
arch=(any)
url='https://www.google.com/get/noto/'
license=(custom:SIL)
makedepends=(git)
source=(git+https://github.com/googlefonts/noto-cjk.git#commit=$_commit
        70-noto-cjk.conf)
sha256sums=('SKIP'
            '528e2bd75c6c9b5931e9c3d381c2056501a5ef4bd80488fdce3a6491f56b2844')

package() {
  install -Dm644 noto-cjk/*/OTC/*.ttc -t "$pkgdir"/usr/share/fonts/noto-cjk
  install -Dm644 noto-cjk/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 70-noto-cjk.conf -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
